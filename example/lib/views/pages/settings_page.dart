import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Enable Proxy Server'),
              value: false,
              onChanged: (bool value) {},
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'Proxy Server Address',
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
        ),
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