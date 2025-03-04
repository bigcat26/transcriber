import 'package:flutter/material.dart';
import 'package:fonnx_example/viewmodels/app_config_viewmodel.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildProxyServerGroup(),
          _buildSttServiceGroup(),
          _buildLlmServiceGroup(),
        ],
      ),
    );
  }

  Widget _buildProxyServerGroup() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child:
         Consumer<AppConfigViewModel>(builder: (context, model, child) {
           final proxyServerController = TextEditingController(text: model.proxyConfig.proxyServer);
          return Column(
            children: [
              SwitchListTile(
                title: Text('Enable Proxy Server'),
                value: model.proxyConfig.proxyEnabled,
                onChanged: (bool value) {},
              ),
              ListTile(
                title: TextField(
                  controller: proxyServerController,
                  onChanged: (value) {
                    // set model.proxyConfig update ...proxyServer
                  },
                  decoration: InputDecoration(
                    labelText: 'Proxy Server Address',
                    hintText: proxyServerController.text
                  ),
                ),
              ),
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
              ),
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildSttServiceGroup() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'STT Service API Address',
                ),
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'API Key',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLlmServiceGroup() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'LLM Service API Address',
                ),
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'API Key',
                ),
              ),
            ),
            ListTile(
              title: DropdownButton<String>(
                items: [
                  DropdownMenuItem(
                    value: 'model1',
                    child: Text('Model 1'),
                  ),
                  DropdownMenuItem(
                    value: 'model2',
                    child: Text('Model 2'),
                  ),
                ],
                onChanged: (String? value) {},
                hint: Text('Select Model'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
