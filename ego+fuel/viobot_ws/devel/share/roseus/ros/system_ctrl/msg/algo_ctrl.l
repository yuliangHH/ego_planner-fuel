;; Auto-generated. Do not edit!


(when (boundp 'system_ctrl::algo_ctrl)
  (if (not (find-package "SYSTEM_CTRL"))
    (make-package "SYSTEM_CTRL"))
  (shadow 'algo_ctrl (find-package "SYSTEM_CTRL")))
(unless (find-package "SYSTEM_CTRL::ALGO_CTRL")
  (make-package "SYSTEM_CTRL::ALGO_CTRL"))

(in-package "ROS")
;;//! \htmlinclude algo_ctrl.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass system_ctrl::algo_ctrl
  :super ros::object
  :slots (_header _algo_enable _algo_reboot _algo_reset ))

(defmethod system_ctrl::algo_ctrl
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:algo_enable __algo_enable) nil)
    ((:algo_reboot __algo_reboot) nil)
    ((:algo_reset __algo_reset) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _algo_enable __algo_enable)
   (setq _algo_reboot __algo_reboot)
   (setq _algo_reset __algo_reset)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:algo_enable
   (&optional __algo_enable)
   (if __algo_enable (setq _algo_enable __algo_enable)) _algo_enable)
  (:algo_reboot
   (&optional __algo_reboot)
   (if __algo_reboot (setq _algo_reboot __algo_reboot)) _algo_reboot)
  (:algo_reset
   (&optional __algo_reset)
   (if __algo_reset (setq _algo_reset __algo_reset)) _algo_reset)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _algo_enable
    1
    ;; bool _algo_reboot
    1
    ;; bool _algo_reset
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _algo_enable
       (if _algo_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _algo_reboot
       (if _algo_reboot (write-byte -1 s) (write-byte 0 s))
     ;; bool _algo_reset
       (if _algo_reset (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _algo_enable
     (setq _algo_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _algo_reboot
     (setq _algo_reboot (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _algo_reset
     (setq _algo_reset (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get system_ctrl::algo_ctrl :md5sum-) "e37859a07726627da20d42fe4eb9bd2b")
(setf (get system_ctrl::algo_ctrl :datatype-) "system_ctrl/algo_ctrl")
(setf (get system_ctrl::algo_ctrl :definition-)
      "Header header
bool algo_enable
bool algo_reboot
bool algo_reset
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :system_ctrl/algo_ctrl "e37859a07726627da20d42fe4eb9bd2b")


