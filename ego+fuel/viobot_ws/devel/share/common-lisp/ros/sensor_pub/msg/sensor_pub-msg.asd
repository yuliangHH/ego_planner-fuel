
(cl:in-package :asdf)

(defsystem "sensor_pub-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ImageInfo" :depends-on ("_package_ImageInfo"))
    (:file "_package_ImageInfo" :depends-on ("_package"))
  ))