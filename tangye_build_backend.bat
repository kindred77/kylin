set VERSION=3.1.1

call mvn clean install -DskipTests -Dcheckstyle.skip=true || { exit 1; }

rm -rf build/lib build/tool || { exit 1; }
mkdir .\build\lib || { exit 1; }
mkdir .\build\tool || { exit 1; }
mkdir .\build\lib\streaming || { exit 1; }
cp assembly/target/kylin-assembly-%VERSION%-job.jar build/lib/kylin-job-%VERSION%.jar || { exit 1; }
cp storage-hbase/target/kylin-storage-hbase-%VERSION%-coprocessor.jar build/lib/kylin-coprocessor-%VERSION%.jar || { exit 1; }
cp jdbc/target/kylin-jdbc-%VERSION%.jar build/lib/kylin-jdbc-%VERSION%.jar || { exit 1; }
cp tool-assembly/target/kylin-tool-assembly-%VERSION%-assembly.jar build/tool/kylin-tool-%VERSION%.jar || { exit 1; }
cp datasource-sdk/target/kylin-datasource-sdk-%VERSION%-lib.jar build/lib/kylin-datasource-sdk-%VERSION%.jar || { exit 1; }
cp stream-receiver/target/kylin-stream-receiver-%VERSION%-all.jar build/lib/streaming/kylin-stream-receiver-%VERSION%-all.jar || { exit 1; }

echo "You can find the jars in ./build/lib/ ./build/tool"

@echo off
pause