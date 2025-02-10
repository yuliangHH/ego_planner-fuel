
(cl:in-package :asdf)

(defsystem "system_ctrl-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "algo_ctrl" :depends-on ("_package_algo_ctrl"))
    (:file "_package_algo_ctrl" :depends-on ("_package"))
    (:file "algo_status" :depends-on ("_package_algo_status"))
    (:file "_package_algo_status" :depends-on ("_package"))
    (:file "viobot_ctrl" :depends-on ("_package_viobot_ctrl"))
    (:file "_package_viobot_ctrl" :depends-on ("_package"))
  ))