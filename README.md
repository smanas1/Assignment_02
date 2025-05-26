
# 1. **PostgreSQL** কি?

হল একটি ওপেন-সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম যেটিকে সংক্ষেপে **RDBMS** বলা হয়ে থাকে । 




## মূল বৈশিষ্ট্য
- **Advanced Data Types**

    স্ট্যান্ডার্ড SQL প্রকারের বাইরে PostgreSQL দিয়ে আমরা JSON, Array সহ আরো অনেক ডাটা টাইপ ব্যবহার করতে পারি । 
- **Extensibility**

    PostgreSQL দিয়ে চাইলে আমরা কাস্টম ফাঙ্কশন, অপারেটর দিয়ে আমরা কাজ করতে পারি ।  


#

ছোট অ্যাপ্লিকেশন থেকে শুরু করে বৃহৎ এন্টারপ্রাইজ সিস্টেম পর্যন্ত এই ডাটাবেস ব্যবহার করা যেতে পারে । এবং এটি ডেভেলপারদের মধ্যে অনেক জনপ্রিয় । 



# 2. `PostgreSQL` এর `Primary Key` এবং  `Foreign Key` 

**Primary Key** হলো একটি কলাম বা কয়েকটি কলাম যেটা Unique ভাবে একটি Row কে চিহ্নিত করে ।   
**Foreign Key** হলো একটি কলাম অথবা কয়েকটি কলাম দ্বারা গঠিত হতে পারে যেটা সংযোগ স্থাপন করে টেবিলের মধ্যে ।

## Primary Key এবং Foreign Key এর সুবিধা

- দ্রুত ডাটা Query যায়
- টেবিল Join করা যায় 
- ডাটা ডুব্লিকেট হওয়া থেকে বিরত থাকা যায়


# 3. PostgreSQL-এ ডেটা পরিবর্তন (UPDATE)

PostgreSQL-এ `UPDATE` স্টেটমেন্ট ব্যবহার করে টেবিলের ডেটা পরিবর্তন করা যায়।  এটি আমাদেরকে একটি বা একাধিক সারি খুঁজে বের করে তাদের নির্দিষ্ট কলামের মান আপডেট করতে দেয় যেমন। 

**সাধারণ সিনট্যাক্স:**
```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```


# 4. GROUP BY Clause এবং Aggregation Operations এর ভূমিকা

`GROUP BY` ব্যবহার করা হয় যখন একটি বা একাধিক কলামের ভিত্তিতে ডেটাকে গ্রুপ করতে হয় এবং প্রতিটি গ্রুপের জন্য অ্যাগ্রিগেশন ফাংশন প্রয়োগ করতে হয়। তখন এটিকে আমরা ব্যবহা করে থাকি।




## যেমন

```
SELECT customer_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY customer_id;
```




# 5. PostgreSQL-এ LIMIT এবং OFFSET Clauses ব্যবহারের উদ্দেশ্য

PostgreSQL-এ LIMIT এবং OFFSET দুটি অনেক গুরুত্বপূর্ণ কারণ এই দুটির মধ্যমে আমরা কতগুলো সারি এবং কোন সারি থেকে দেখতে চাই সেগুলো বলেদেয়া যায়।

`Limit` ক্লজ ব্যবহার করা হয় SELECT স্টেটমেন্টের ফলাফলকে একটি নির্দিষ্ট সংখ্যক সারিতে সীমাবদ্ধ করার জন্য। আপনি ডেটাবেস থেকে যতগুলো সারি ফেরত পেতে চাই, `LIMIT` ক্লজের মাধ্যমে সেটি উল্লেখ করে দিতে পারি।

* **সিনট্যাক্স:**
    ```
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition 
    ORDER BY column_name 
    LIMIT number_of_rows;
    ```

`OFFSET` ক্লজ ব্যবহার করা হয় ফলাফলের সারির তালিকা থেকে কতগুলো সারি বাদ দিয়ে গণনা শুরু করতে চাই, তা নির্দিষ্ট করার জন্য। এটি মূলত পেজিনেশন (pagination) করার জন্য দরকারি - অর্থাৎ, ডেটা কয়েকটি পৃষ্ঠায় ভাগ করে দেখানোর জন্য।

*   **সিনট্যাক্স:**
    ```sql
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition  
    ORDER BY column_name 
    OFFSET number_of_rows_to_skip;
    LIMIT number_of_rows;
    ```

