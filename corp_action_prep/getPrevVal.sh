#!/bin/sh
exec scala -savecompiled "$0" "$@"
!#

val lslscsv = scala.io.Source.fromFile(args(0)).getLines.toList.map(x => x.split(",").toList)

val mapSym = lslscsv.filter(x => x(2) != "--" && x(2) != "0.000001").groupBy(_(1))

val mm = lslscsv.map(line =>
{
  val sym = line(1)
  if ((line(2).equals("--") || line(2).equals("0.000001")) && mapSym.contains(sym)) {
    val prevAct = mapSym.get(sym).get.sortBy(_(0)).reverse.head
    List(line(0), sym, prevAct(2), prevAct(3))
  }
  else line
}
)

mm.foreach(x => println(x.mkString(",")))
