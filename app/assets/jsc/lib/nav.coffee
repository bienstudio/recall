$ ->
  nav_toggle = $('.header__nav-toggle')
  nav_toggle_icon = nav_toggle.children()[0]
  navs = $('.nav--mobile')

  nav_toggle.on 'click', ->
    navs.each ->
      nav = $(@)
      nav.toggleClass 'nav--mobile-showing'

    if nav_toggle_icon.innerHTML == "rows"
      nav_toggle_icon.innerHTML = "close"
    else
      nav_toggle_icon.innerHTML = "rows"
