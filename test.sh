cd ./ansible/01-k8s-install-masters_e_workers

ANSIBLE_OUT=$(ansible-playbook -i hosts test.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa)
echo $ANSIBLE_OUT

STATUS_K8S=$(echo $ANSIBLE_OUT | grep -oE "(control-plane.*?.*?)'")

if [[ -z $STATUS_K8S ]]
  then
    echo "::::: kubernetes nao esta configurado :::::"
    exit 1
  else
    echo "::::: cluster kubernetes multi master configurado :::::"
    exit 0
fi
