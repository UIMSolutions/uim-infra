/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.http.enumerations.httpmethods;

enum HTTPMETHODS : string {
  // HTTP GET method
  METHOD_GET = "GET",
  // HTTP POST method
  METHOD_POST = "POST",
  // HTTP PUT method
  METHOD_PUT = "PUT",
  // HTTP DELETE method
  METHOD_DELETE = "DELETE",
  // HTTP PATCH method
  METHOD_PATCH = "PATCH",
  // HTTP OPTIONS method
  METHOD_OPTIONS = "OPTIONS",
  // HTTP TRACE method
  METHOD_TRACE = "TRACE",
  // HTTP HEAD method
  METHOD_HEAD = "HEAD"
}
