(ns example.handler
  (:use [example.sender])
  (:require [compojure.core :refer :all]
            [compojure.handler :as handler]
            [compojure.route :as route]
            [ring.util.response :refer [resource-response response]]))

(defroutes app-routes
  (GET "/" []
       (resource-response "index.html" {:root "public"}))
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
