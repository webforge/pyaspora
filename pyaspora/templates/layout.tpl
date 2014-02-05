<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
{#
Standard page layout.
#}
{%from 'widgets.tpl' import button_form%}
<html lang="en">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    {% block head %}
    <link rel="stylesheet" href="/static/style.css" />
    <title>Pyaspora</title>
    {% endblock %}
</head>
<body>
    <h1>Pyaspora</h1>
	<div id="header">
		{% block header %}
			{% if logged_in %}
				Logged in as 
				<a href="/contact/profile?username={{ logged_in.contact.username |e }}">{{ logged_in.contact.realname |e }}</a>
				-
                {{button_form(url_for('users.logout'), 'Log out')}}
			{% else %}
                {{button_form(url_for('users.login'), 'Log in')}}
			{% endif %}
		{% endblock %}
	</div>
	{% block error %}
		{% if status == 'error' %}
		    <ul class="errors">
	    		{% for message in errors %}
	      			<li>{{ message }}</li>
    			{% endfor %}
    		</ul>
  		{% endif %}
  	{% endblock %}
	<div id="content">
    	{% block content %}{% endblock %}
    </div>
</body>
