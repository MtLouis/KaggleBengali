# Import data
library(readr)
air_reserve <- read_csv("C:/Users/Nico/Desktop/Kaggle/Restaurant forecasting/data/air_reserve.csv")
air_reserve = data.frame(air_reserve)
air_visit <- read_csv("C:/Users/Nico/Desktop/Kaggle/Restaurant forecasting/data/air_visit_data.csv")
air_visit = data.frame(air_visit)
air_info <- read_csv("C:/Users/Nico/Desktop/Kaggle/Restaurant forecasting/data/air_store_info.csv")
air_info = data.frame(air_info)
hpg_reserve <- read_csv("C:/Users/Nico/Desktop/Kaggle/Restaurant forecasting/data/hpg_reserve.csv")
hpg_reserve = data.frame(hpg_reserve)

# Difficulty Reasoning per store_id (and then by kind and all features found)
# Counting how many different restaurants
print("different restaurants in visit and reserve")
nrow(table(air_visit$air_store_id))
nrow(table(air_reserve$air_store_id))
# To get a vector with unique restos names
# unique(air_visit$air_store_id)

# Inner join with the dataframes according to restaurants id AND visit time
colnames(air_visit)[2] = colnames(air_reserve)[2]
air_merged = merge(air_visit,air_reserve)
colnames(air_merged)[3] = "no_reserve_visitors"


# Plotting visits from air_visit and from air_reserve on same graph
plot(air_merged$visit_datetime,air_merged$reserve_visitors, col = "green", cex=0.3)
points(air_merged$visit_datetime,air_merged$no_reserve_visitors, col = "red",cex=0.3)
# plot(air_merged$visit_datetime,air_merged$reserve_visitors-air_merged$visitors, col = "green", cex=0.3)

# Gathered dataset for first studies (only among air datas)
air = merge(air_merged, air_info)