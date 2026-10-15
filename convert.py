import pandas as pd

print("Loading Excel file...")
df = pd.read_excel('Online Retail.xlsx', engine='openpyxl')
print(f"Loaded {len(df)} rows")

df.to_csv('data/raw_sales.csv', index=False, encoding='ISO-8859-1')
print("Saved as data/raw_sales.csv")