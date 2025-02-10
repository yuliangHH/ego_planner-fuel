; Auto-generated. Do not edit!


(cl:in-package sensor_pub-msg)


;//! \htmlinclude ImageInfo.msg.html

(cl:defclass <ImageInfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (exposure
    :reader exposure
    :initarg :exposure
    :type cl:integer
    :initform 0)
   (analog_gain
    :reader analog_gain
    :initarg :analog_gain
    :type cl:float
    :initform 0.0)
   (digital_gain
    :reader digital_gain
    :initarg :digital_gain
    :type cl:float
    :initform 0.0))
)

(cl:defclass ImageInfo (<ImageInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImageInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImageInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_pub-msg:<ImageInfo> is deprecated: use sensor_pub-msg:ImageInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_pub-msg:header-val is deprecated.  Use sensor_pub-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'exposure-val :lambda-list '(m))
(cl:defmethod exposure-val ((m <ImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_pub-msg:exposure-val is deprecated.  Use sensor_pub-msg:exposure instead.")
  (exposure m))

(cl:ensure-generic-function 'analog_gain-val :lambda-list '(m))
(cl:defmethod analog_gain-val ((m <ImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_pub-msg:analog_gain-val is deprecated.  Use sensor_pub-msg:analog_gain instead.")
  (analog_gain m))

(cl:ensure-generic-function 'digital_gain-val :lambda-list '(m))
(cl:defmethod digital_gain-val ((m <ImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_pub-msg:digital_gain-val is deprecated.  Use sensor_pub-msg:digital_gain instead.")
  (digital_gain m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImageInfo>) ostream)
  "Serializes a message object of type '<ImageInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'exposure)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'exposure)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'exposure)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'exposure)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'analog_gain))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'digital_gain))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImageInfo>) istream)
  "Deserializes a message object of type '<ImageInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'exposure)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'exposure)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'exposure)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'exposure)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'analog_gain) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'digital_gain) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImageInfo>)))
  "Returns string type for a message object of type '<ImageInfo>"
  "sensor_pub/ImageInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageInfo)))
  "Returns string type for a message object of type 'ImageInfo"
  "sensor_pub/ImageInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImageInfo>)))
  "Returns md5sum for a message object of type '<ImageInfo>"
  "26da7a856946892d3a235072866504a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImageInfo)))
  "Returns md5sum for a message object of type 'ImageInfo"
  "26da7a856946892d3a235072866504a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImageInfo>)))
  "Returns full string definition for message of type '<ImageInfo>"
  (cl:format cl:nil "Header header~%uint32 exposure~%float32 analog_gain~%float32 digital_gain~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImageInfo)))
  "Returns full string definition for message of type 'ImageInfo"
  (cl:format cl:nil "Header header~%uint32 exposure~%float32 analog_gain~%float32 digital_gain~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImageInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImageInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'ImageInfo
    (cl:cons ':header (header msg))
    (cl:cons ':exposure (exposure msg))
    (cl:cons ':analog_gain (analog_gain msg))
    (cl:cons ':digital_gain (digital_gain msg))
))
