// Auto-generated. Do not edit!

// (in-package sensor_pub.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ImageInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.exposure = null;
      this.analog_gain = null;
      this.digital_gain = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('exposure')) {
        this.exposure = initObj.exposure
      }
      else {
        this.exposure = 0;
      }
      if (initObj.hasOwnProperty('analog_gain')) {
        this.analog_gain = initObj.analog_gain
      }
      else {
        this.analog_gain = 0.0;
      }
      if (initObj.hasOwnProperty('digital_gain')) {
        this.digital_gain = initObj.digital_gain
      }
      else {
        this.digital_gain = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImageInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [exposure]
    bufferOffset = _serializer.uint32(obj.exposure, buffer, bufferOffset);
    // Serialize message field [analog_gain]
    bufferOffset = _serializer.float32(obj.analog_gain, buffer, bufferOffset);
    // Serialize message field [digital_gain]
    bufferOffset = _serializer.float32(obj.digital_gain, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImageInfo
    let len;
    let data = new ImageInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [exposure]
    data.exposure = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [analog_gain]
    data.analog_gain = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [digital_gain]
    data.digital_gain = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor_pub/ImageInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '26da7a856946892d3a235072866504a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint32 exposure
    float32 analog_gain
    float32 digital_gain
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImageInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.exposure !== undefined) {
      resolved.exposure = msg.exposure;
    }
    else {
      resolved.exposure = 0
    }

    if (msg.analog_gain !== undefined) {
      resolved.analog_gain = msg.analog_gain;
    }
    else {
      resolved.analog_gain = 0.0
    }

    if (msg.digital_gain !== undefined) {
      resolved.digital_gain = msg.digital_gain;
    }
    else {
      resolved.digital_gain = 0.0
    }

    return resolved;
    }
};

module.exports = ImageInfo;
