(ns example.handler
  (:use [example.sender])
  (:require [compojure.core :refer :all]
            [compojure.handler :as handler]
            [compojure.route :as route]))

(defroutes app-routes
  (POST "/send" {session :session
                 params :params}
        (let [receivers (:receivers params)
              subject (:subject params)
              body (:body params)]
          (send-message receivers subject body)))
  (route/resources "/")
  (route/not-found "Not Found"))

(def app
  (handler/site app-routes))
