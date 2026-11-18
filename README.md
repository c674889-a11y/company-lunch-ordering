# 午餐小管家

手機優先的公司午餐訂購系統，使用原生 HTML/CSS/JavaScript，可直接放到 GitHub Pages；資料庫介面預留 Supabase。

## 目前功能

- 員工以工號進入系統
- 管理員以 Supabase Auth Email／密碼登入
- 每日菜單與訂餐截止時間（預設每日 10:00）
- 修改／取消當日訂單
- 管理後台：今日訂單、搜尋、餐點篩選、統計、Excel 匯出
- 管理員新增今日菜單
- 未設定 Supabase 時可用展示資料操作

## 連接 Supabase

1. 在 Supabase SQL Editor 執行 `supabase-schema.sql`。
2. 到 `app.js` 填入 Supabase Project URL 與 anon public key。
3. 將整個資料夾推送到 GitHub，Settings → Pages → Deploy from branch。

## 管理員帳號

在 Supabase Authentication → Users 建立管理員 Email／密碼帳號，然後在 `employees` 資料表把該 Email 的 `role` 設為 `admin`。登入畫面選擇「管理員／Email」即可。

請只使用 anon public key，不要把 `service_role` key 放到前端。現有工號登入是展示／內部 MVP 版本；正式上線前應改用 Supabase Auth 與更嚴格的 RLS。
