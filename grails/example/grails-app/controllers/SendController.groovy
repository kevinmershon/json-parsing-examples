import groovy.json.JsonSlurper

class SendController {
    def slurper = new JsonSlurper()

    def index = {
        def subject = params["subject"]
        def body = params["body"]
        def receivers = slurper.parseText(params["receivers"])

        println("\nTo:")
        receivers.findAll { it.type == "to" }.each {
            println(it.address)
        }
        println("\nCC:")
        receivers.findAll { it.type == "cc" }.each {
            println(it.address)
        }
        println("\nSubject: ${subject}")
        println("Body: ${body}")

        render("ok")
    }
}
