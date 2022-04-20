from functools import reduce
from app.generators.abstractstatsservice import StatsGenerator
from app.stats_storages.bike_stats_storage import BikeStats
from app.stats_storages.bike_stats_storage import BikeStat

class BikeStatsGenerator(StatsGenerator):
    def __init__(self):
        pass

    def get_stats(self, trips, _unprocessed_data_amount=0) -> BikeStats: # unprocessed_data_amount=0 since in this part unprocessed data is not used
        bikes = {trip.bike_number for trip in trips}  # made the set of unique bikes
        processed_stats = []
        for bike in bikes:
            bike_trips = list(filter(lambda trip: trip.bike_number == bike, trips)) # all trips list made by 1 particular bike
            total_bike_trips_amount = self.get_general_trips_amount(bike_trips)
            bike_term_of_use = self.get_time_of_all_bike_trips(bike_trips)
            stats_per_bike = BikeStat(total_bike_trips_amount, bike_term_of_use, bike)
            processed_stats.append(stats_per_bike)
        sorted_stats = self.sort_data(processed_stats) #BikeStats.stats=sorted_stats
        bikes_stats = BikeStats(sorted_stats)#
        print("bike_stats is generated")
        return bikes_stats

    def get_time_of_all_bike_trips(self, bike_trips): # returns term of use of particular bike
        model_trip = bike_trips[0]
        term_of_use = reduce(lambda x, trip: x + (trip.dates.end_date-trip.dates.start_date), bike_trips[1:], model_trip.dates.end_date - model_trip.dates.start_date)
        return term_of_use

    def sort_data(self, processed_bikes_list):
        sorted_bike_stats = sorted(processed_bikes_list, key=lambda x: x.bikes_trips_amount, reverse=True)
        return sorted_bike_stats
