---
layout: post
title:  "Preventing CSRF in Kohana"
date:   2010-07-16 10:00:00 +0800
categories: Coding "Techinical Stuff"
---

# Preventing CSRF in Kohana
*Posted on July 16, 2010*

Recently, I found a neat CSRF module for Kohana:

[GitHub - synapsestudios/kohana-csrf](http://github.com/synapsestudios/kohana-csrf)

I liked its simple design: you generate a token for your form, then validate the token when it's submitted. Unfortunately, I can't use this solely for my project. The first issue with this module is that it will require me to manually add support for every single form and be very careful when adding AJAX and regular forms together. So I forked it.

[GitHub - isieo/kohana-csrf](http://github.com/isieo/kohana-csrf)

What I did was add a controller that returns the token as JSON and included a "fake javascript" file. My javascript is simple; it's a simple jQuery script that injects a hidden field containing the token that was requested via AJAX. The token is then validated by the controller automatically, which upon success un-assigns the token element from the `$_POST` array and rejects it if invalid. With that, CSRF tokens are transparent to your front-end designers (if you are working with one), and all you need to tell your JavaScript programmer to do is call `getCSRFToken()` and post it in every Ajax Call.

## Example usage for normal forms:
```html
<!DOCTYPE html>
<html>
    <head>
        ...
        <script src="jquery-goes-here.js" />
        <script src="<?=url::site('/csrf/javascript/csrf.js');?>" />
    </head>
    <body>
        ...
        <form action="" method="post">
            <input type="email" name="emailaddress" />
            <input type="submit" value="submit">
        </form>
    </body>
</html>
```

That will work out of the box! No including pesky <input type="hidden"> crap in your form.

#Example using an AJAX call in jQuery:

```javascript
$.post("<?=url::site('/email/add');?>", 
         { 
           'email':'someone@example.com',
           'csrf-token' : getCSRFToken() 
         }
       );
```

All you need to do is add the 'csrf-token' : getCSRFToken() into the AJAX request. Simple, no need to do callbacks for AJAX calls that don't require them.

Security in using JSON for getting token: Some of you might argue that serving tokens in JSON isn't secure, but if you read about JSONP (yes, JSON with a P), you will notice that JSON doesn't work well cross-domain. I am no security expert, but hey, according to robubu.com there are no current vulnerabilities in using "serialized object" JSON (PHP's json_encode function returns that by default).

So there you go, a simple and nice module to prevent CSRF in Kohana, coupled with jQuery Populate Plugin, you get "pure HTML" forms that will make your front-end guy happy and not bug you for any assistance.

Update: As of 3 hours prior to this post, it supports Namespaces to support multiple forms, but still, it's quite troublesome trying to keep track of token namespaces when you have many forms on the same page, which is going to make the front-end guy and you cry. It's still a great module to use if you are working alone or you have an application that needs to be super-duper-uber-hacker-proof secure.