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
    letterId = $(e.target).attr('data-letter-id')

    xhr = $.post("#{@urlRoot}/read_correct", {
        letter_id: letterId
    })

    xhr.done(() =>
      @next()
    )

    xhr.fail(() =>
      alert("网络错误, 请稍候重试")
    )

  readWrong: (e) ->
    letterId = $(e.target).attr('data-letter-id')

    xhr = $.post("#{@urlRoot}/read_wrong", {
        letter_id: letterId
    })

    xhr.done(() =>
      @next()
    )

    xhr.fail(() =>
      alert("网络错误, 请稍候重试")
    )

  next: () ->
    if @letters.length > @index + 1
      @index += 1
      letter = @letters[@index]
      @testLetter(letter)
    else
      @finish()

  finish: () ->
    @timeEnd = new Date().getTime()
    time = @timeEnd - @timeBegin

    xhr = $.post("#{@urlRoot}/finish", {
      time: time
    })

    xhr.done (data, status, response) =>
      correct = data.correct
      wrong = data.wrong
      time = time

      html = """
        <div>Finish!</div>
        <div>Correct: #{correct}!</div>
        <div>wrong: #{wrong}!</div>
        <div>Spend: #{(time/1000/60).toFixed(0)} Min #{(time/1000%60).toFixed(0)} Sec!</div>
      """

      @element.html(html)

  bindBeginButton: () ->
    @triggerButton.click @begin.bind(@)

  begin: (e) ->
    @timeBegin = new Date().getTime()
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
          <a href="javascript: void(0);" data-letter-id="#{letter.id}" class="btn btn-default read-correct">
            正确
          </a>
          <a href="javascript: void(0);" data-letter-id="#{letter.id}" class="btn btn-default read-wrong">
            错误
          </a>
        </div>
      </div>
    """
    @element.html(html)