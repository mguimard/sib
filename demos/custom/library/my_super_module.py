from ansible.module_utils.basic import AnsibleModule

def main():
    module = AnsibleModule(
        argument_spec=dict(
            data=dict(type='str', default='pong'),
        ),
        supports_check_mode=True
    )

    if module.check_mode == True: 
        print('check....')

    if module.params['data'] == 'crash':
        raise Exception("Error: are you root ?")

    if module.params['data'] == 'changed':
        changed = True
    else:
        changed = False
    # code custom...
    ## modif serveur puis...
    
    if module.params['data'] == 'error':
        fail = True
        errorMsg = "Booom ca a pas marché"
    else:
        fail = False
        errorMsg = ''

    result = dict(
        ping=module.params['data'],
        hey="hoo",
        changed=changed,
        failed = fail,
        msg = errorMsg
    )

    module.exit_json(**result)


if __name__ == '__main__':
    main()
