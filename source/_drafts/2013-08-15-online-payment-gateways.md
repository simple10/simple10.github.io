Apps that make money accept payments. Yeah, duh.

Accepting payments has traditionally been a PITA. For my first business in college,
I wrote a shopping cart in perl and connected it up to Authorize.Net's proprietary
and clumsy (at the time) payment gateway. Almost all of my coding efforts went towards 
wiring up the shopping cart and handling errors from Authorize.Net.

Fast forward to today and companies like Stripe, WePay, and Balanced have radically 
simplified the development process with modern APIs and straightforward pricing.
And companies like PayPal, Amazon, and Google have made it possible for users to make 
purchases across the web without re-entering their credit card information.

So which payment system should you use for your app?

Pretty much all of them charge in the ballpark of 2.9% + $0.30 for each transaction.
How they all agreed on this is anyone's guess and [open for discussion on HN](https://news.ycombinator.com/item?id=6533653).

If you want to beat 2.9%, you need to do a lot of volume or switch to a traditional 
merchant account and integrate with Authorize.Net or similar gateway.

There's one notable exception, PayPal has tiered pricing for micropayments. 
You can [apply](https://www.paypal.com/webapps/mpp/paypal-payments-advanced) for a 
5% + $0.05 fee for transactions under $10. However, you'll get hit with an 
additional 2.5% currency conversion rate and 1% fee to accept payments from 
other countries.

The simplest, most straightforward solution for developers is Stripe. Everything 
is a flat 2.9% + $0.30 fee regardless of country of origin, Amex, or other gotchas.

For comparison, if you want to go the traditional merchant account rate, here's 
what you can get from [MerchantOne](http://www.merchantone.com/)...

* $19.95/mo account fee regardless of usage
* 0.89% + $0.20 fee for debit/bank cards
* 1.99% + $0.20 fee for credit cards
* no application or other setup fees, assuming they waive the $99 Authorize.Net fee for you

But then you have to integrate with Authorize.Net. For some customers, this is a plus.
For most developers, this is a big minus.




