class @Test
  constructor: (options) ->
    {@letters, @urlRoot, @triggerButton, @element} = options

    @bindEvents()
    @index = 0

  bindEvents: () ->
    @bindBeginButton()
    @bindNextButton()

  bindNextButton: () ->
    @element.on 'click', '.read-correct', @readCorrect.bind(@)
    @element.on 'click', '.read-wrong', @readWrong.bind(@)

  readCorrect: (e) ->
    @next()

  readWrong: (e) ->
    @next()

  next: () ->
    if @letters.length > @index + 1
      @index += 1
      letter = @letters[@index]
      @testLetter(letter)
    else
      @finish()

  finish: () ->
    html = """
      <div>Finish!</div>
    """
    @element.html(html)

  bindBeginButton: () ->
    @triggerButton.click @begin.bind(@)

  begin: (e) ->
    letter = @letters[@index]
    @testLetter(letter)

  testLetter: (letter) ->
    @render(letter)

  render: (letter) ->
    html = """
      <div>
        <div class="letter-read letter">
          #{letter.name}
        </div>
        <div class="oprations">
          <a href="javascript: void(0);" data-url="#{@urlRoot}" data-letter-id="#{letter.id}" class="btn btn-default read-correct">
            正确
          </a>
          <a href="javascript: void(0);" data-url="#{@urlRoot}" data-letter-id="#{letter.id}" class="btn btn-default read-wrong">
            错误
          </a>
        </div>
      </div>
    """
    @element.html(html)