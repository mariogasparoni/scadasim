import inet.nodes.inet.Router;
import scadasim.nodes.inet.InetUserHost;
import scadasim.nodes.inet.BackupServer;
import scadasim.nodes.inet.NameServer;
import scadasim.nodes.inet.InteractiveServer;
import scadasim.nodes.inet.MailServer;
import scadasim.nodes.inet.WebServer;
import scadasim.nodes.inet.StreamingServer;
import scadasim.nodes.inet.TraceRouter;
import scadasim.base.ConnectionManager;
import scadasim.base.TrafficProfileManager;
import scadasim.networklayer.autorouting.TGMNetworkConfigurator;

package scadasim;
channel server2edge extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 10Mbps;
}

channel host2edge extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 0.128Mbps;
}
channel edge2host extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 0.768Mbps;
}
channel edge2gateway extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 155Mbps;
}
channel gateway2core extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 1000Mbps;
}
channel core2core extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 2500Mbps;
}
channel stub2stub extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 5000Mbps;
}
channel stub2transit extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 5000Mbps;
}
channel transit2transit extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 10000Mbps;
}

module InternetTiny
{
    parameters:
        @Internet();
    submodules:
        tgmNetworkConfigurator: TGMNetworkConfigurator {
            parameters:
                totalCountOfAS = 3;
                @display("p=20,20;i=abstract/table_s");
        }
        connectionManager: ConnectionManager {
            parameters:
                @display("p=60,20;i=block/classifier_s");
        }
        trafficProfileManager: TrafficProfileManager {
            parameters:
                @display("p=100,20;i=block/cogwheel_s");
        }

        remote0: TAS0 {
            parameters:
                @AS();
                @display("i=misc/globe_s");
        }
        corporate1: SAS1 {
            parameters:
                @AS();
                @display("i=misc/cloud_s");
        }
        corporate2: SAS2 {
            parameters:
                @AS();
                @display("i=misc/cloud_s");
        }

    connections:
        remote0.pppg++ <--> stub2transit <--> corporate1.pppg++;
        remote0.pppg++ <--> stub2transit <--> corporate2.pppg++;
        corporate1.pppg++ <--> stub2stub <--> corporate2.pppg++;

}

network InetTiny extends InternetTiny
{
    parameters:
}

module TAS0
{
    gates:
        inout pppg[];
    submodules:
        connectionManager: ConnectionManager {
            parameters:
                @display("p=20,20;i=block/classifier_s");
        }

        core0: Router {
            parameters:
                @RL();
                @CoreRouter();
                @display("i=abstract/switch");
        }
        gw1: Router {
            parameters:
                @RL();
                @display("i=abstract/router2");
        }
        edge2: Router {
            parameters:
                @RL();
                @display("i=abstract/router");
        }
        host_WebServer5: WebServer {
            parameters:
                @RL();
                @display("i=device/laptop");
        }
        host6: InetUserHost {
            parameters:
                @RL();
                @display("i=device/laptop");
        }
    connections:
        pppg++ <--> core0.pppg++;
        pppg++ <--> core0.pppg++;

        core0.pppg++ <--> gateway2core <--> gw1.pppg++;
        gw1.pppg++ <--> edge2gateway <--> edge2.pppg++;
        host_WebServer5.pppg$o++ --> server2edge --> edge2.pppg$i++;
        edge2.pppg$o++ --> server2edge --> host_WebServer5.pppg$i++;
        host6.pppg$o++ --> host2edge --> edge2.pppg$i++;
        edge2.pppg$o++ --> edge2host --> host6.pppg$i++;
}

module SAS1
{
    gates:
        inout pppg[];
    submodules:
        connectionManager: ConnectionManager {
            parameters:
                @display("p=20,20;i=block/classifier_s");
        }

        core0: Router {
            parameters:
                @RL();
                @CoreRouter();
                @display("i=abstract/switch");
        }
        gw1: Router {
            parameters:
                @RL();
                @display("i=abstract/router2");
        }
        edge6: Router {
            parameters:
                @RL();
                @display("i=abstract/router");
        }
        host_WebServer23: WebServer {
            parameters:
                @RL();
                @display("i=device/laptop");
        }
    connections:
        pppg++ <--> core0.pppg++;
        pppg++ <--> core0.pppg++;

        core0.pppg++ <--> gateway2core <--> gw1.pppg++;
        gw1.pppg++ <--> edge2gateway <--> edge6.pppg++;
        host_WebServer23.pppg$o++ --> server2edge --> edge6.pppg$i++;
        edge6.pppg$o++ --> server2edge --> host_WebServer23.pppg$i++;
}

module SAS2
{
    gates:
        inout pppg[];
    submodules:
        connectionManager: ConnectionManager {
            parameters:
                @display("p=20,20;i=block/classifier_s");
        }

        core0: Router {
            parameters:
                @RL();
                @CoreRouter();
                @display("i=abstract/switch");
        }
        gw1: Router {
            parameters:
                @RL();
                @display("i=abstract/router2");
        }
        edge4: Router {
            parameters:
                @RL();
                @display("i=abstract/router");
        }
        host_WebServer13: WebServer {
            parameters:
                @RL();
                @display("i=device/laptop");
        }
    connections:
        pppg++ <--> core0.pppg++;
        pppg++ <--> core0.pppg++;

        core0.pppg++ <--> gateway2core <--> gw1.pppg++;
        gw1.pppg++ <--> edge2gateway <--> edge4.pppg++;
        host_WebServer13.pppg$o++ --> server2edge --> edge4.pppg$i++;
        edge4.pppg$o++ --> server2edge --> host_WebServer13.pppg$i++;
}
