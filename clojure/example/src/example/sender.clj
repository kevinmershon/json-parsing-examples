(ns example.sender
  (:use [ring.util.response])
  (:require [clojure.data.json :as json]))

(defn send-message
  [receivers subject body]
  (let [receivers-json (json/read-str receivers :key-fn keyword)]
    (println "\nTo: ")
    (doseq [x receivers-json]
      (if (= (:type x) "to")
        (println (:address x))))
    (println "\nCC: ")
    (doseq [x receivers-json]
      (if (= (:type x) "cc")
        (println (:address x))))
    (println (str "\nSubject: " subject))
    (println (str "Body: " body))
    (response "ok")))
