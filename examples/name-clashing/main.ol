from A.main import A
from B.main import B
from console import Console

service main {

    embed Console as Console
    embed A as A
    embed B as B

    main{
        println@Console("A prints " + version@A())()
        println@Console("B prints " + version@B())()
    }
}