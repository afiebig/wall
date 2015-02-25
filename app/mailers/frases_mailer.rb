class FrasesMailer < ActionMailer::Base
  default from: "all+wall@continuum.cl", to: "all@continuum.cl"

  def nueva_frase(frase)
    @frase = frase
    mail(subject: "Nueva frase desafortunada")
  end
end
