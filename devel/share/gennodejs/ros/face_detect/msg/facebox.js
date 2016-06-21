// Auto-generated. Do not edit!

// (in-package face_detect.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class facebox {
  constructor() {
    this.top = 0;
    this.left = 0;
    this.width = 0;
    this.height = 0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type facebox
    // Serialize message field [top]
    bufferInfo = _serializer.uint16(obj.top, bufferInfo);
    // Serialize message field [left]
    bufferInfo = _serializer.uint16(obj.left, bufferInfo);
    // Serialize message field [width]
    bufferInfo = _serializer.uint16(obj.width, bufferInfo);
    // Serialize message field [height]
    bufferInfo = _serializer.uint16(obj.height, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type facebox
    let tmp;
    let len;
    let data = new facebox();
    // Deserialize message field [top]
    tmp = _deserializer.uint16(buffer);
    data.top = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [left]
    tmp = _deserializer.uint16(buffer);
    data.left = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [width]
    tmp = _deserializer.uint16(buffer);
    data.width = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [height]
    tmp = _deserializer.uint16(buffer);
    data.height = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'face_detect/facebox';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '84a8772d0473c9a0b5e2268e6352f57e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 top
    uint16 left
    uint16 width
    uint16 height
    
    `;
  }

};

module.exports = facebox;
