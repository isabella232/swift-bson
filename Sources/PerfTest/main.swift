import Foundation
import SwiftBSON

struct CrudTestFile: Decodable {
    let data: [BSONDocument]
    let tests: [BSONDocument]

    let minServerVersion: String?
    let maxServerVersion: String?
}

let jsonString = """
{
  "data": [
    {
      "_id": 1,
      "x": 11
    },
    {
      "_id": 2,
      "x": 22
    }
  ],
  "minServerVersion": "2.6",
  "tests": [
    {
      "description": "BulkWrite with deleteOne operations",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "deleteOne",
              "arguments": {
                "filter": {
                  "_id": 3
                }
              }
            },
            {
              "name": "deleteOne",
              "arguments": {
                "filter": {
                  "_id": 2
                }
              }
            }
          ],
          "options": {
            "ordered": true
          }
        }
      },
      "outcome": {
        "result": {
          "deletedCount": 1,
          "insertedCount": 0,
          "insertedIds": {},
          "matchedCount": 0,
          "modifiedCount": 0,
          "upsertedCount": 0,
          "upsertedIds": {}
        },
        "collection": {
          "data": [
            {
              "_id": 1,
              "x": 11
            }
          ]
        }
      }
    },
    {
      "description": "BulkWrite with deleteMany operations",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "deleteMany",
              "arguments": {
                "filter": {
                  "x": {
                    "$lt": 11
                  }
                }
              }
            },
            {
              "name": "deleteMany",
              "arguments": {
                "filter": {
                  "x": {
                    "$lte": 22
                  }
                }
              }
            }
          ],
          "options": {
            "ordered": true
          }
        }
      },
      "outcome": {
        "result": {
          "deletedCount": 2,
          "insertedCount": 0,
          "insertedIds": {},
          "matchedCount": 0,
          "modifiedCount": 0,
          "upsertedCount": 0,
          "upsertedIds": {}
        },
        "collection": {
          "data": []
        }
      }
    },
    {
      "description": "BulkWrite with insertOne operations",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 3,
                  "x": 33
                }
              }
            },
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 4,
                  "x": 44
                }
              }
            }
          ],
          "options": {
            "ordered": true
          }
        }
      },
      "outcome": {
        "result": {
          "deletedCount": 0,
          "insertedCount": 2,
          "insertedIds": {
            "0": 3,
            "1": 4
          },
          "matchedCount": 0,
          "modifiedCount": 0,
          "upsertedCount": 0,
          "upsertedIds": {}
        },
        "collection": {
          "data": [
            {
              "_id": 1,
              "x": 11
            },
            {
              "_id": 2,
              "x": 22
            },
            {
              "_id": 3,
              "x": 33
            },
            {
              "_id": 4,
              "x": 44
            }
          ]
        }
      }
    },
    {
      "description": "BulkWrite with replaceOne operations",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "replaceOne",
              "arguments": {
                "filter": {
                  "_id": 3
                },
                "replacement": {
                  "x": 33
                }
              }
            },
            {
              "name": "replaceOne",
              "arguments": {
                "filter": {
                  "_id": 1
                },
                "replacement": {
                  "x": 12
                }
              }
            },
            {
              "name": "replaceOne",
              "arguments": {
                "filter": {
                  "_id": 3
                },
                "replacement": {
                  "x": 33
                },
                "upsert": true
              }
            }
          ],
          "options": {
            "ordered": true
          }
        }
      },
      "outcome": {
        "result": {
          "deletedCount": 0,
          "insertedCount": 0,
          "insertedIds": {},
          "matchedCount": 1,
          "modifiedCount": 1,
          "upsertedCount": 1,
          "upsertedIds": {
            "2": 3
          }
        },
        "collection": {
          "data": [
            {
              "_id": 1,
              "x": 12
            },
            {
              "_id": 2,
              "x": 22
            },
            {
              "_id": 3,
              "x": 33
            }
          ]
        }
      }
    },
    {
      "description": "BulkWrite with updateOne operations",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "updateOne",
              "arguments": {
                "filter": {
                  "_id": 0
                },
                "update": {
                  "$set": {
                    "x": 0
                  }
                }
              }
            },
            {
              "name": "updateOne",
              "arguments": {
                "filter": {
                  "_id": 1
                },
                "update": {
                  "$set": {
                    "x": 11
                  }
                }
              }
            },
            {
              "name": "updateOne",
              "arguments": {
                "filter": {
                  "_id": 2
                },
                "update": {
                  "$inc": {
                    "x": 1
                  }
                }
              }
            },
            {
              "name": "updateOne",
              "arguments": {
                "filter": {
                  "_id": 3
                },
                "update": {
                  "$set": {
                    "x": 33
                  }
                },
                "upsert": true
              }
            }
          ],
          "options": {
            "ordered": true
          }
        }
      },
      "outcome": {
        "result": {
          "deletedCount": 0,
          "insertedCount": 0,
          "insertedIds": {},
          "matchedCount": 2,
          "modifiedCount": 1,
          "upsertedCount": 1,
          "upsertedIds": {
            "3": 3
          }
        },
        "collection": {
          "data": [
            {
              "_id": 1,
              "x": 11
            },
            {
              "_id": 2,
              "x": 23
            },
            {
              "_id": 3,
              "x": 33
            }
          ]
        }
      }
    },
    {
      "description": "BulkWrite with updateMany operations",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "updateMany",
              "arguments": {
                "filter": {
                  "x": {
                    "$lt": 11
                  }
                },
                "update": {
                  "$set": {
                    "x": 0
                  }
                }
              }
            },
            {
              "name": "updateMany",
              "arguments": {
                "filter": {
                  "x": {
                    "$lte": 22
                  }
                },
                "update": {
                  "$unset": {
                    "y": 1
                  }
                }
              }
            },
            {
              "name": "updateMany",
              "arguments": {
                "filter": {
                  "x": {
                    "$lte": 22
                  }
                },
                "update": {
                  "$inc": {
                    "x": 1
                  }
                }
              }
            },
            {
              "name": "updateMany",
              "arguments": {
                "filter": {
                  "_id": 3
                },
                "update": {
                  "$set": {
                    "x": 33
                  }
                },
                "upsert": true
              }
            }
          ],
          "options": {
            "ordered": true
          }
        }
      },
      "outcome": {
        "result": {
          "deletedCount": 0,
          "insertedCount": 0,
          "insertedIds": {},
          "matchedCount": 4,
          "modifiedCount": 2,
          "upsertedCount": 1,
          "upsertedIds": {
            "3": 3
          }
        },
        "collection": {
          "data": [
            {
              "_id": 1,
              "x": 12
            },
            {
              "_id": 2,
              "x": 23
            },
            {
              "_id": 3,
              "x": 33
            }
          ]
        }
      }
    },
    {
      "description": "BulkWrite with mixed ordered operations",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 3,
                  "x": 33
                }
              }
            },
            {
              "name": "updateOne",
              "arguments": {
                "filter": {
                  "_id": 2
                },
                "update": {
                  "$inc": {
                    "x": 1
                  }
                }
              }
            },
            {
              "name": "updateMany",
              "arguments": {
                "filter": {
                  "_id": {
                    "$gt": 1
                  }
                },
                "update": {
                  "$inc": {
                    "x": 1
                  }
                }
              }
            },
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 4,
                  "x": 44
                }
              }
            },
            {
              "name": "deleteMany",
              "arguments": {
                "filter": {
                  "x": {
                    "$nin": [
                      24,
                      34
                    ]
                  }
                }
              }
            },
            {
              "name": "replaceOne",
              "arguments": {
                "filter": {
                  "_id": 4
                },
                "replacement": {
                  "_id": 4,
                  "x": 44
                },
                "upsert": true
              }
            }
          ],
          "options": {
            "ordered": true
          }
        }
      },
      "outcome": {
        "result": {
          "deletedCount": 2,
          "insertedCount": 2,
          "insertedIds": {
            "0": 3,
            "3": 4
          },
          "matchedCount": 3,
          "modifiedCount": 3,
          "upsertedCount": 1,
          "upsertedIds": {
            "5": 4
          }
        },
        "collection": {
          "data": [
            {
              "_id": 2,
              "x": 24
            },
            {
              "_id": 3,
              "x": 34
            },
            {
              "_id": 4,
              "x": 44
            }
          ]
        }
      }
    },
    {
      "description": "BulkWrite with mixed unordered operations",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "replaceOne",
              "arguments": {
                "filter": {
                  "_id": 3
                },
                "replacement": {
                  "_id": 3,
                  "x": 33
                },
                "upsert": true
              }
            },
            {
              "name": "deleteOne",
              "arguments": {
                "filter": {
                  "_id": 1
                }
              }
            },
            {
              "name": "updateOne",
              "arguments": {
                "filter": {
                  "_id": 2
                },
                "update": {
                  "$inc": {
                    "x": 1
                  }
                }
              }
            }
          ],
          "options": {
            "ordered": false
          }
        }
      },
      "outcome": {
        "result": {
          "deletedCount": 1,
          "insertedCount": 0,
          "insertedIds": {},
          "matchedCount": 1,
          "modifiedCount": 1,
          "upsertedCount": 1,
          "upsertedIds": {
            "0": 3
          }
        },
        "collection": {
          "data": [
            {
              "_id": 2,
              "x": 23
            },
            {
              "_id": 3,
              "x": 33
            }
          ]
        }
      }
    },
    {
      "description": "BulkWrite continue-on-error behavior with unordered (preexisting duplicate key)",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 2,
                  "x": 22
                }
              }
            },
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 3,
                  "x": 33
                }
              }
            },
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 4,
                  "x": 44
                }
              }
            }
          ],
          "options": {
            "ordered": false
          }
        }
      },
      "outcome": {
        "error": true,
        "result": {
          "deletedCount": 0,
          "insertedCount": 2,
          "matchedCount": 0,
          "modifiedCount": 0,
          "upsertedCount": 0,
          "upsertedIds": {}
        },
        "collection": {
          "data": [
            {
              "_id": 1,
              "x": 11
            },
            {
              "_id": 2,
              "x": 22
            },
            {
              "_id": 3,
              "x": 33
            },
            {
              "_id": 4,
              "x": 44
            }
          ]
        }
      }
    },
    {
      "description": "BulkWrite continue-on-error behavior with unordered (duplicate key in requests)",
      "operation": {
        "name": "bulkWrite",
        "arguments": {
          "requests": [
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 3,
                  "x": 33
                }
              }
            },
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 3,
                  "x": 33
                }
              }
            },
            {
              "name": "insertOne",
              "arguments": {
                "document": {
                  "_id": 4,
                  "x": 44
                }
              }
            }
          ],
          "options": {
            "ordered": false
          }
        }
      },
      "outcome": {
        "error": true,
        "result": {
          "deletedCount": 0,
          "insertedCount": 2,
          "matchedCount": 0,
          "modifiedCount": 0,
          "upsertedCount": 0,
          "upsertedIds": {}
        },
        "collection": {
          "data": [
            {
              "_id": 1,
              "x": 11
            },
            {
              "_id": 2,
              "x": 22
            },
            {
              "_id": 3,
              "x": 33
            },
            {
              "_id": 4,
              "x": 44
            }
          ]
        }
      }
    }
  ]
}
"""
//print("made string")
//var doc = try ExtendedJSONDecoder().decode(BSONDocument.self, from: jsonString.data(using: .utf8)!)
//print("decoded doc")
let decoder = BSONDecoder()

let result = try BSONDecoder().decode(CrudTestFile.self, from: jsonString)
print("done")
