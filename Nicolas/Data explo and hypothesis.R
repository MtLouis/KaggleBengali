# DATA EXPLORATION AND HYPOTHESIS TESTING

# Import and visualize data frames (train, test, others)
res = air_reserve
vis = air_visit
kind = air_info
print(str(res))

# Check missing values
print(table(is.na(air_reserve)))

# NOTE YOUR HYPOTHESIS

# UNIVARIATE ANALYSIS

# NUMERICAL DATA: Visualize distributions (histogramm or table)
par(mfrow=c(2,1))
hist(res$reserve_visitors)
hist(vis$visitors)

# CATEGORICAL DATA: Convert as factor and visualize tables
res$air_store_id = as.factor(res$air_store_id)
vis$air_store_id = as.factor(vis$air_store_id)
print(table(res$air_store_id))
print("Total: ")
print(sum(table(res$air_store_id)))

# MULTIVARIATE ANALYSIS: to verify hypothesis (corelations...), take time into account (ARIMA) or discover features (ACP)

# TEMPORAL DATA: add new variable according to hypothesis, can also be converted to time series objects
res$res_time = format(as.POSIXct(as.character(res$reserve_datetime
    ),format = "%Y-%m-%d %T"),
      format = "%T")
res$res_month = format(as.POSIXct(as.character(res$reserve_datetime
    ),format = "%Y-%m-%d %T"),
     format = "%m")
res$res_day = as.factor(weekdays(as.Date(res$reserve_datetime)))
res$res_year = format(as.POSIXct(as.character(res$reserve_datetime
    ),format = "%Y-%m-%d %T"),
      format = "%Y")

# Visualize seasonality and trends at different timeframes (boxplots, can be log scaled)
# NB: can be performed precisely with ARIVA preliminary study
par(mfrow = c(2,2))
boxplot(res$reserve_visitors~res$res_time, log="y")
boxplot(res$reserve_visitors~res$res_day, log = "y")
boxplot(res$reserve_visitors~res$res_month, log = "y")
boxplot(res$reserve_visitors~res$res_year, log = "y")

# Visualize auto-correlation in time
ts_res = as.ts(res$reserve_visitors)
par(mfrow=c(1,2))
acf(ts_res,lag.max = 5)
pacf(ts_res,lag.max = 5)

# Visualize correlation between quantitative variables (after possible merging)
merged = merge(vis, res)
print(cor(merged$visitors,merged$reserve_visitors))

# Visualize crossed tables for qualitative variables
kind_tab = table(kind$air_genre_name,kind$air_area_name)
heatmap(kind_tab)

# But also ACP, AFD, Clustering, Advanced exploratory tools!

# Feature engineering: make the model more relevant

# Learning phase, tuning, test, cross validation