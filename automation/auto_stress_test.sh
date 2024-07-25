#!/usr/bin/env bash

# 压测脚本中设定的压测时间应为20秒
export jmx_filename="order_auto.jmx"

# 需要在系统变量中定义jmeter根目录的位置，如下
# export jmeter_path="/your jmeter path/"

echo "自动化压测开始"

# 压测并发数列表
#thread_number_array=(2 10 30 40 50)
thread_number_array=(10 20 30)
for num in "${thread_number_array[@]}"
do
    echo "压测并发数 ${num}"
    # 定义jtl结果文件名与压测报告路径
    export jtl_filename="test_${num}.jtl"
    export web_report_path_name="web_${num}"

    rm -f ${jtl_filename}
    rm -rf ${web_report_path_name}

    cp ${jmx_template_filename} ${jmx_filename}
    echo "生成jmx压测脚本 ${jmx_filename}"

    if [[ "${os_type}" == "Darwin" ]]; then
        sed -i "" "s/thread_num/${num}/g" ${jmx_filename} #将jmx文件的thread数动态设置
    else
        sed -i "s/thread_num/${num}/g" ${jmx_filename}
    fi

    # JMeter 静默压测
    echo "开始 JMeter 静默压测。。。"
    #nohup ${jmeter_path}/bin/jmeter -n -t ${jmx_filename} -l ${jtl_filename} -e -o ${web_report_path_name} &
    nohup jmeter -n -t ${jmx_filename} -l ${jtl_filename} -e -o ${web_report_path_name} &
    sleep 80
    killJMeter
    rm -f ${jmx_filename}
    # JMeter 静默压测 + 生成html压测报告
    ${jmeter_path}/bin/jmeter -n -t ${jmx_filename} -l ${jtl_filename}  -Jthread=${num} -e -o ${web_report_path_name}
    echo "结束压测并发数 ${num}"
done
echo "自动化压测全部结束"

