-- SELECT

select * from actor
select        first_name as ten_dien_vien, 
              last_name  as ho_dien_vien   from actor;

-- BT: list tất cả các khách hàng với ttin họ, tên, email
select * from customer;
select        first_name as "tên khách hàng", 
              last_name  as "họ khách hàng",
	          email      as "địa chỉ email"   from customer;
	   
-- ORDER BY

select * from actor
order by      first_name desc, 
              actor_id   asc; -- với những người cùng tên thì sx theo id tăng dần

select * from payment
order by      customer_id, 
              amount       desc, 
			  payment_date asc;

-- DISTINCT

select * from   actor;
select distinct first_name, 
                last_name 
from 		    actor
order by        first_name;

-- BT: sx đơn hàng với giá từ cao đến thấp
select * from   payment;
select distinct amount   from payment
order by        amount   desc;

-- LIMIT

-- BT: top 100 hóa đơn có giá trị lớn nhất 
select * from payment
order by      amount desc
limit         100;

-- WHERE

select * from payment
where not     amount >= 10.99; -- >, <, =, >=, <=, <>/!=

select * from actor
where         first_name = 'NICK'; -- dùng '', not ""


select * from actor
where         first_name is not null; -- dùng null khi muốn tìm record bị trống (is null)/ko bị trống (is not null) dữ liệu

-- BT: Ql kho muốn cc thanh toán ko quá $2, bao gồm mã tt & số tiền
select * from payment; 
select        payment_id, 
              amount        
from          payment
where         amount <= 2.00;

-- AND/OR

-- BT: các đơn hàng có giá trị lớn hơn $4 và nhỏ hơn $9
select * from payment
where         amount > 4.00 
and           amount < 9.00;

select * from payment
where not     amount < 4.00 
or            amount > 9.00;

-- BT: các đơn hàng có giá trị lớn hơn $9 hoặc nhỏ hơn $4
select * from payment
where         amount < 4.00 
or            amount > 9.00;

select * from payment
where not     amount > 4.00 
and           amount < 9.00;

-- BT: thanh toán của 322, 346, 354; tiền < $2 or > $10. Tăng dần mã KH, giảm dần tiền
select * from payment
where        (customer_id = 322
or            customer_id = 346      -- nhớ dùng or và đóng mở ngoặc
or            customer_id = 354)
and          (amount      < 2.00
or            amount      > 10.0)
order by      customer_id,
              amount desc;
			  
-- BETWEEN

select * from payment
where         amount >= 2.00
and           amount <= 9.00;

select * from payment
where         amount between 2.00 
                     and     9.00;

-- IN

-- BT: các hóa đơn có id 16055, 16061, 16065, 16068
select * from payment
where         payment_id = 16055
or            payment_id = 16061
or            payment_id = 16065
or            payment_id = 16068;

select * from payment
where         payment_id in (16055, 16061, 16065, 16068);

-- BT: customer id: 12, 25, 67, 93, 124, 234 & amount: 4.99, 7.99, 9.99 & date: 01/2020
select * from payment
where         customer_id  in      (12, 25, 67, 93, 124, 234)
and           amount       in      (4.99, 7.99, 9.99)
and           payment_date between '2020-01-01 00:00:01.996577+07' 
                           and     '2020-01-31 23:59:59.996577+07';

-- LIKE

select * from actor 
where         first_name like 'J%'   -- bắt đầu bằng J
and           first_name like '%E'   -- kết thúc bằng E
and           first_name like '%N%'; -- chứa N ở giữa

select * from actor
where         last_name like '__I%'; -- I ở vị trí thứ 3

-- BT: các kh có last name bắt đầu bằng J hoặc F
select * from customer 
where         last_name like 'J%'
or            last_name like 'F%';


-- BT: các kh có last name ko bắt đầu bằng J hoặc F
select * from customer 
where not    (last_name like 'J%'
or            last_name like 'F%');

select * from customer 
where         last_name not like 'J%'
and           last_name not like 'F%';

-- BT: ds film chứa 'Saga' trong mô tả + tiêu đề = 'A%' or '%R'
select * from film
where        (description like '%Saga%')
and          (title       like 'A%'
or 			  title       like '%R');

-- BT: ds kh tên chứa 'ER' & '_A' + họ desc
select * from customer
where         first_name like '%ER%'
and           first_name like '_A%'
order by      last_name  desc;
