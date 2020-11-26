# THE CUTEKITTENS SHOP

### Welcome to the kitten shop!


![](https://icatcare.org/app/uploads/2018/07/Helping-your-new-cat-or-kitten-settle-in-1.png)

## What is the CuteKittens Shop?

This is an online shop selling cute kitten pictures. Customers can sign up, sign in, put their favourite pictures in their cart, and pay. 

This is a rather minimalist version of the shop. We could have implemented countless features, but the point of this project was to deliver an MVP version in just 4 days time. 


## Objectives of this project

This project was one of two final projects required to validate the first 3 months of a 6 months-long coding bootcamp. It was all coded in pair programming by 4 students: @Rudyar @vanaklay @Mtwod @colinebrlt

The main objectives of this project were to:
* learn the importance of the agile methodology and comprehend its importance when it comes to teamwork
* realize that after 10 weeks of learning programming, we are able to create a functioning website with the most common features implemented, namely:
    * Devise: signing in, loging in and out features
    * ActionMailer: sending an email to users after the creation of an account, and after every purchase
    * Stripe: for the payment 


## How to open the website

The quickest and easiest way to do it would be to open it on Heroku: https://online-shop-thp.herokuapp.com/

Or you can run the following commands in your terminal:

1) Clone this repository 
```shell
$ git clone https://github.com/colinebrlt/online-shop-thp
```

2) Prepare the initialization of the repository
```shell
$ bundle install
```

```shell
$ rails db:create
```

```shell
$ rails db:migrate
```

```shell
$ rails db:seed
```

3) Run the app in your server
```shell
$ rails server
```

4) Now all you need to do is open it in your faborite browser

## Authors

@vanaklay
@Mtwod
@Rudyar
@colinebrlt

(special thanks to our mentor: @MatthieuLPro)