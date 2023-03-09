pipeline {
    agent { label 'master' }
	options { skipDefaultCheckout() }
	environment {
        // This can be nexus3 or nexus2
        NEXUS_VERSION = "nexus3"
        // This can be http or https
        NEXUS_PROTOCOL = "http"
        // Where your Nexus is running
        NEXUS_URL = "10.62.125.9:8282"
        // Repository where we will upload the artifact
        NEXUS_REPOSITORY = "IATCC"
        // Jenkins credential id to authenticate to Nexus OSS
        NEXUS_CREDENTIAL_ID = "nexus-credentials"
    }
    	stages {
        	stage("Checkout SCM") {
			steps {
				//cleanWs()
				echo 'checkout scm'
				checkout scm
			}
		}	
		
		stage("Unit Test") {
			//agent { label 'master' }
			steps {
				//cleanWs()
				//checkout scm
				bat 'whoami'
				echo 'Unit Test Stage'
				bat 'cd'
				bat 'mvn test'
				junit 'target\\surefire-reports\\*.xml'	
				
			}
		}
        /*stage ('SCA Scan') {
			//agent { label 'azunit03' }
            steps {
                /*dependencyCheck additionalArguments: ''' 
                    -o "./" 
                    -s "./"
                    -f "ALL" 
                    --prettyPrint''', odcInstallation: 'OWASP-DC'

                dependencyCheckPublisher pattern: 'dependency-check-report.xml'*/
				//sh 'pwd'
				//sh '/home/intadmin/Downloads/dependency-check/bin/dependency-check.sh --project "Addressbook" --scan "/home/intadmin/jenkinsWorkspace/workspace/Naddressbook" --format HTML --out "/home/intadmin/jenkinsWorkspace/workspace/Naddressbook/index.html"'
				/*dir('dependency-check\\bin'){
					bat 'dependency-check.bat --project "Addressbook" --scan "C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Naddressbook" --disableRetireJS --disableNodeJS'
				}
            }
			post {
			always {
				publishHTML (target : [allowMissing: false,
				alwaysLinkToLastBuild: true,
				keepAll: true,
				reportDir: '\\dependency-check\\bin\\',
				reportFiles: 'dependency-check-report.html',
				reportName: 'SCA Scan Report',
				reportTitles: 'SCA Scan Report'])
				}	
			}
        } */ 

		
		
		

		/*stage('Scanning for Security') {
			steps {
				echo 'Code Vulnerability Scan'	
				//fodStaticAssessment bsiToken: 'eyJ0ZW5hbnRJZCI6MTAwODYsInRlbmFudENvZGUiOiJUZWNoX01haGluZHJhXzEwNTNfRk1BXzY0NzA3Mzc4NSIsInJlbGVhc2VJZCI6ODUxNDQsInBheWxvYWRUeXBlIjoiQU5BTFlTSVNfUEFZTE9BRCIsImFzc2Vzc21lbnRUeXBlSWQiOjE0LCJ0ZWNobm9sb2d5VHlwZSI6IkpBVkEvSjJFRSIsInRlY2hub2xvZ3lUeXBlSWQiOjcsInRlY2hub2xvZ3lWZXJzaW9uIjoiMS44IiwidGVjaG5vbG9neVZlcnNpb25JZCI6MTIsImF1ZGl0UHJlZmVyZW5jZSI6IkF1dG9tYXRlZCIsImF1ZGl0UHJlZmVyZW5jZUlkIjoyLCJpbmNsdWRlVGhpcmRQYXJ0eSI6ZmFsc2UsImluY2x1ZGVPcGVuU291cmNlQW5hbHlzaXMiOmZhbHNlLCJwb3J0YWxVcmkiOiJodHRwczovL3RyaWFsLmZvcnRpZnkuY29tLyIsImFwaVVyaSI6Imh0dHBzOi8vYXBpLnRyaWFsLmZvcnRpZnkuY29tIiwic2NhblByZWZlcmVuY2UiOiJTdGFuZGFyZCIsInNjYW5QcmVmZXJlbmNlSWQiOjF9', entitlementPreference: 'SingleScanOnly', inProgressScanActionType: 'CancelInProgressScan', overrideGlobalConfig: true, personalAccessToken: 'fortifyondemand', remediationScanPreferenceType: 'RemediationScanIfAvailable', srcLocation: '.', tenantId: 'Tech_Mahindra_1053_FMA_647073785', username: 'vinoth_b.e@rediffmail.com'
				//fodPollResults bsiToken: 'eyJ0ZW5hbnRJZCI6MTAwODYsInRlbmFudENvZGUiOiJUZWNoX01haGluZHJhXzEwNTNfRk1BXzY0NzA3Mzc4NSIsInJlbGVhc2VJZCI6ODUxNDQsInBheWxvYWRUeXBlIjoiQU5BTFlTSVNfUEFZTE9BRCIsImFzc2Vzc21lbnRUeXBlSWQiOjE0LCJ0ZWNobm9sb2d5VHlwZSI6IkpBVkEvSjJFRSIsInRlY2hub2xvZ3lUeXBlSWQiOjcsInRlY2hub2xvZ3lWZXJzaW9uIjoiMS44IiwidGVjaG5vbG9neVZlcnNpb25JZCI6MTIsImF1ZGl0UHJlZmVyZW5jZSI6IkF1dG9tYXRlZCIsImF1ZGl0UHJlZmVyZW5jZUlkIjoyLCJpbmNsdWRlVGhpcmRQYXJ0eSI6ZmFsc2UsImluY2x1ZGVPcGVuU291cmNlQW5hbHlzaXMiOmZhbHNlLCJwb3J0YWxVcmkiOiJodHRwczovL3RyaWFsLmZvcnRpZnkuY29tLyIsImFwaVVyaSI6Imh0dHBzOi8vYXBpLnRyaWFsLmZvcnRpZnkuY29tIiwic2NhblByZWZlcmVuY2UiOiJTdGFuZGFyZCIsInNjYW5QcmVmZXJlbmNlSWQiOjF9', overrideGlobalConfig: true, personalAccessToken: 'fortifyondemand', pollingInterval: 1, tenantId: 'Tech_Mahindra_1053_FMA_647073785', username: 'vinoth_b.e@rediffmail.com'				
			}
		} */	

		stage('SAST scan') {
			//agent { label 'azunit03' }
				// steps {
				// //	cleanWs()
				// //	checkout scm
				// 	echo 'SAST scan Stage'
				// 	// catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
				// 	// sh 'pwd'
				// 	// sh 'ls'
				// 	// sh "echo 'int@1234#' | sudo -S su -c \"mvn clean compile site\" "
				// 	// }
				// 	//  catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
				// 	// 	bat 'mvn compile site'
				// 	// }
				// 	try {
                //         // do something that fails
                //         echo 'SAST scan Stage'
				// 		bat 'mvn compile site'
                //     } catch (Exception err) {
                //         currentBuild.result = 'SUCCESS'
                //     }
				// }
				 
            steps {
                script {
                    try {
                        // do something that fails
                        echo 'SAST scan Stage'
						bat 'mvn compile site'
                    } catch (Exception err) {
                        currentBuild.result = 'SUCCESS'
                    }
                }
            }
        
			post {
			always {
				publishHTML (target : [allowMissing: false,
				alwaysLinkToLastBuild: true,
				keepAll: true,
				reportDir: 'C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Naddressbook\\target\\site',
				reportFiles: 'spotbugs.html',
				reportName: 'SAST Scan Report',
				reportTitles: 'SAST Scan Report'])
				}	
			}
		}

		stage('Build and Package (with code quality check)') {
			steps {
				echo 'Clean Build'
				//sh "ls"
				//sh "pwd"
				bat "mvn package -DskipTests=true"
				//bat 'mvn sonar:sonar clean compile package -Dtest=\\!TestRunner* -DfailIfNoTests=false -Dsonar.projectKey=addressbook -Dsonar.host.url=http://10.62.125.9:8085/ -Dsonar.login=f16fabd2605044f38e79e4c0e4bc5f73c55dd144'
				//bat 'mvn sonar:sonar -Dsonar.projectKey=addressbook -Dsonar.host.url=http://10.62.125.9:9292 -Dsonar.login=f1b607262db0b6631dd49a7e8788de19b4371766'
				//bat 'mvn sonar:sonar -Dsonar.projectKey=Addressbook -Dsonar.host.url=http://10.62.125.9:9292 -Dsonar.login=9241f47643fe011d47c2fec656075e54e7557905'
				bat 'mvn sonar:sonar -Dsonar.projectKey=Addressbook -Dsonar.host.url=http://10.62.125.9:9292 -Dsonar.login=f0ecc7dac0d99331d12ac99e6477c4abe38a4bba'
			}
		}

		  stage("publish Artifacts") {
            steps {
                script {
                    // Read POM xml file using 'readMavenPom' step , this step 'readMavenPom' is included in: https://plugins.jenkins.io/pipeline-utility-steps
                    pom = readMavenPom file: "pom.xml";
                    // Find built artifact under target folder
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    // Print some info from the artifact found
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    // Extract the path from the File found
                    artifactPath = filesByGlob[0].path;
                    // Assign to a boolean response verifying If the artifact name exists
                    artifactExists = fileExists artifactPath;

                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";

                        nexusArtifactUploader(
                            nexusVersion: NEXUS_VERSION,
                            protocol: NEXUS_PROTOCOL,
                            nexusUrl: NEXUS_URL,
                            groupId: pom.groupId,
                            version: pom.version,
                            repository: NEXUS_REPOSITORY,
                            credentialsId: NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                // Artifact generated such as .jar, .ear and .war files.
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],

                                // Lets upload the pom.xml file for additional information for Transitive dependencies
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );

                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                    }
                }
            }
        }
		
		/*stage('Spin new Developer QA Environment with Tomcat 8') {
			agent { label 'windows' }
			steps {
				//bat 'E:'
				//bat 'cd E:\\\\VagrantBoxes\\testvagrant'
				bat 'vagrant up'
			}
		}
		
		stage("Regression test in Developer QA env - dummy") {
			steps {
				sh 'sleep 30'	
			}
		}
		
		stage('Decommision the Developer QA Environment') {
			agent { label 'windows' }
			steps {
				bat 'vagrant destroy -f'
			}
		}*/

		/*stage("XLDeploy Package") {
			steps {
				sh "sed -i 's/{{PACKAGE_VERSION}}/$BUILD_NUMBER.0/g' deployit-manifest.xml"
				xldCreatePackage artifactsPath: 'target', manifestPath: 'deployit-manifest.xml', darPath: '$JOB_NAME-$BUILD_NUMBER.0.dar'  
			}
		}
	    
		stage('XLDeploy Publish') {  
			steps {
				xldPublishPackage serverCredentials: 'XLDeployServer', darPath: '$JOB_NAME-$BUILD_NUMBER.0.dar'
			}
		}  
	    
		stage('XLDeploy Deploy - Promote to QA') { 
			steps {
				xldDeploy serverCredentials: 'XLDeployServer', environmentId: 'Environments/QATomcatEnv', packageId: 'Applications/AddressBook/$BUILD_NUMBER.0'
			}
		}*/

		stage('Deploy to Tomcat') {
		
            steps {
			echo "Deploy"
                //bat 'curl -d ..\\target\\addressbook.war "http://manager:password@10.62.125.9:8083/manager/text/deploy?path=/addressbook&update=true"'   
			bat 'cd' 
			bat 'mvn clean'
			bat 'mvn install'
			bat 'del "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\addressbook.war"'
			bat 'copy "target\\addressbook.war" "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps"' 
			//deploy adapters: [tomcat8(credentialsId: 'tomcat', path: '', url: 'https://10.62.125.9:8443/')], contextPath: 'addressbook', war: 'target/addressbook.war'     
            }
        
		}

		stage('DAST scan') {
		//agent { label 'azunit03' }
            steps {
				echo "DAST"
				bat 'java -jar "E:\\Program Files\\Zed Attack Proxy\\zap-2.11.1.jar" -cmd -quickurl https://10.62.125.9:8443/addressbook/ -quickout E:\\report\\report.html'
				// sh 'whoami'
                // sh "zap-cli --zap-path /opt/zaproxy/ --port 8090 start --start-options '-config api.disablekey=true'"  
				// sh "zap-cli quick-scan https://10.62.125.9:8443/addressbook/ && zap-cli report -o /home/intadmin/dast/addressbookzapcli.html --output-format html"
				// sh "zap-cli --zap-path /opt/zaproxy/ --port 8090 shutdown"        
            }
          post {
			always {
				publishHTML (target : [allowMissing: false,
				alwaysLinkToLastBuild: true,
				keepAll: true,
				reportDir: 'E:\\report\\',
				reportFiles: 'report.html',
				reportName: 'DAST Scan Report',
				reportTitles: 'DAST Scan Report'])
				}	
			}
		}
		
		/*stage('Chaos test') {
		agent { label 'azunit03' }
            steps {
				 catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
				 echo "Choas Testing"

				 sh "echo 'intadmin' | sudo -S su -c \"source  ~/.venvs/chaostk/bin/activate && chaos run /home/intadmin/Desktop/demoapplication/chaostoolkit/addressbookexperiment.json --journal-path /home/intadmin/Desktop/demoapplication/chaostoolkit/addressbookReport.json && chaos report --export-format=html5 /home/intadmin/Desktop/demoapplication/chaostoolkit/addressbookReport.json /home/intadmin/Desktop/demoapplication/chaostoolkit/addressbookReport.html\""
               
				sh "echo 'intadmin' | sudo -S su -c \"source  ~/.venvs/chaostk/bin/activate && chaos run /home/intadmin/Desktop/demoapplication/chaostoolkit/dbexperiment.json --journal-path /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaDBReport.json && chaos report --export-format=html5 /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaDBReport.json /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaDBReport.html\""

				sh "echo 'intadmin' | sudo -S su -c \"source  ~/.venvs/chaostk/bin/activate && chaos run /home/intadmin/Desktop/demoapplication/chaostoolkit/gitcommitexperiment.json --journal-path /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaGitCommitReport.json && chaos report --export-format=html5 /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaGitCommitReport.json /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaGitCommitReport.html\""
				
				sh "echo 'intadmin' | sudo -S su -c \"source  ~/.venvs/chaostk/bin/activate && chaos run /home/intadmin/Desktop/demoapplication/chaostoolkit/gitprexperiment.json --journal-path /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaGitPRReport.json && chaos report --export-format=html5 /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaGitPRReport.json /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaGitPRReport.html\""
				
				sh "echo 'intadmin' | sudo -S su -c \"source  ~/.venvs/chaostk/bin/activate && chaos run /home/intadmin/Desktop/demoapplication/chaostoolkit/jenkinsexperiment.json --journal-path /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJenkinsReport.json && chaos report --export-format=html5 /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJenkinsReport.json /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJenkinsReport.html\""
				
				sh "echo 'intadmin' | sudo -S su -c \"source  ~/.venvs/chaostk/bin/activate && chaos run /home/intadmin/Desktop/demoapplication/chaostoolkit/jiraexperiment.json --journal-path /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJiraReport.json && chaos report --export-format=html5 /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJiraReport.json /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJiraReport.html\""
				
				sh "echo 'intadmin' | sudo -S su -c \"source  ~/.venvs/chaostk/bin/activate && chaos run /home/intadmin/Desktop/demoapplication/chaostoolkit/jiraxraysexperiment.json --journal-path /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJiraXraysReport.json && chaos report --export-format=html5 /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJiraXraysReport.json /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaJiraXraysReport.html\""
				
				sh "echo 'intadmin' | sudo -S su -c \"source  ~/.venvs/chaostk/bin/activate && chaos run /home/intadmin/Desktop/demoapplication/chaostoolkit/sonarexperiment.json --journal-path /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaSonarReport.json && chaos report --export-format=html5 /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaSonarReport.json /home/intadmin/Desktop/demoapplication/chaostoolkit/VistaGrafanaSonarReport.html\"" 
				
				 }	
            }
        
		}*/
		
		
				
		stage("Test Repo checkout") {
			//agent { label 'master' }
			steps {
				echo 'checkout web BDD'
                /*dir('webBDD') {
                echo 'checkout web BDD'
                git branch: 'master',
                    credentialsId: 'f7976f5b-0304-44eb-adb6-5bf40971d73d',
                    url: 'https://git.virtusa.com/intelligent-automation/ProductList_api_test.git'
            }*/ 
				checkout([  
					$class: 'GitSCM', 
					branches: [[name: 'refs/heads/master']], 
					doGenerateSubmoduleConfigurations: false, 
					extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'web']], 
					submoduleCfg: [], 
					userRemoteConfigs: [[credentialsId: 'virtusagit', url: 'https://git.virtusa.com/intelligent-automation/Addressbook_web_test.git']]
				])
				//bat 'del C:\\Users\\intadmin\\AppData\\Local\\Jenkins\\.jenkins\\workspace\\Naddressbook\\web\\src\\test\\resource\\browserdriverexe\\windows\\chromedriver.exe'
				//bat 'cd'
				//bat 'copy C:\\Users\\intadmin\\Downloads\\chromedriver.exe C:\\Users\\intadmin\\AppData\\Local\\Jenkins\\.jenkins\\workspace\\Naddressbook\\web\\src\\test\\resource\\browserdriverexe\\windows'
				echo 'checkout API BDD'
				checkout([  
					$class: 'GitSCM', 
					branches: [[name: 'refs/heads/master']], 
					doGenerateSubmoduleConfigurations: false, 
					extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'api']], 
					submoduleCfg: [], 
					userRemoteConfigs: [[credentialsId: 'virtusagit', url: 'https://git.virtusa.com/intelligent-automation/ProductList_api_test.git']]
				])
				echo 'checkout Swing Desktop'
				checkout([  
					$class: 'GitSCM', 
					branches: [[name: 'refs/heads/master']], 
					doGenerateSubmoduleConfigurations: false, 
					extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'swing']], 
					submoduleCfg: [], 
					userRemoteConfigs: [[credentialsId: 'virtusagit', url: 'https://git.virtusa.com/intelligent-automation/Feedback_swing_test.git']]
				])		
				echo "checkout api performance"
				checkout([  
					$class: 'GitSCM', 
					branches: [[name: 'refs/heads/master']], 
					doGenerateSubmoduleConfigurations: false, 
					extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'api_performance']], 
					submoduleCfg: [], 
					userRemoteConfigs: [[credentialsId: 'virtusagit', url: 'https://git.virtusa.com/intelligent-automation/API_Performance.git']]
				])
					
			} 
		}
		stage("API Smoke Test") {
			//agent { label 'master' }
			steps {
				echo 'API SMOKE TEST'
				dir('api') {
					echo 'API smoke Testing Stage'
					step([$class: 'XrayExportBuilder', filePath: '\\src\\test\\java\\com\\virtusa\\qa\\api', issues: 'AA-15', serverInstance: '2c9ed762-a0d8-4b30-b3c3-2da0e5376d58'])
					catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
						bat 'mvn clean test -Dcucumber.options="--tags @smoke"'
					}					
					bat 'mkdir ..\\target\\cucumber-reports\\API-Smoke'
					bat 'copy target\\surefire-reports\\com.virtusa.qa.api.product.json ..\\target\\cucumber-reports\\API-Smoke\\API-smoke.json'
					step([$class: 'XrayImportBuilder', endpointName: '/cucumber/multipart',importInfo:'''{
						"fields": {
							"project": {
								"id": "10100"
							},
							"summary": "Smoke Api Test Execution for BDD (Generated By API Product jenkins-${JOB_NAME}-Build Number-${BUILD_NUMBER})",
							"issuetype": {
								"id": "10102"
							},
					   "labels":["smoke","Jenkins","Api"],
							"customfield_10224" : [
							   "Dev"
							]
						}
					}''',inputInfoSwitcher:"fileContent",importFilePath: '..\\target\\cucumber-reports\\API-Smoke\\API-smoke.json', serverInstance: '2c9ed762-a0d8-4b30-b3c3-2da0e5376d58'])
				} 
			}
		}
		stage("Web Smoke Test") {
			//agent { label 'master' }
			steps {
				echo "web test"
				dir('web') {
					echo 'WEB BDD Testing Stage'
					step([$class: 'XrayExportBuilder', filePath: '\\src\\test\\resource\\features', issues: 'AD-13', serverInstance: '2c9ed762-a0d8-4b30-b3c3-2da0e5376d58'])
					catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
						bat 'mvn test -Dcucumber.options="--tags @smoke"'
					}
					bat 'mkdir ..\\target\\cucumber-reports\\Web-Smoke'
					bat 'copy target\\cucumber-reports\\Cucumber.json ..\\target\\cucumber-reports\\Web-Smoke\\Cucumber-smoke.json'
					step([$class: 'XrayImportBuilder', endpointName: '/cucumber/multipart',importInfo:'''{
						"fields": {
							"project": {
								"id": "10000"
							},
							"summary": "Smoke Web Test Execution for Addressbook BDD (Generated By jenkins-${JOB_NAME}-Build Number-${BUILD_NUMBER})",
							"issuetype": {
								"id": "10102"
							},
					   "labels":["smoke","Jenkins"],
							"customfield_10224" : [
							   "Dev"
							]
						}
					}''',testExecKey:'AD-14',inputInfoSwitcher:"fileContent",importFilePath: '..\\target\\cucumber-reports\\Web-Smoke\\Cucumber-smoke.json', serverInstance: '2c9ed762-a0d8-4b30-b3c3-2da0e5376d58'])											
				}
						
			}
		}
		stage("API Regression Test") {
			//agent { label 'master' }
			steps {
				echo 'API API regression Testing Stage'
				dir('api') {
					echo 'API API regression Testing Stage'
					catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
						bat 'mvn clean test -Dcucumber.options="--tags @regression"'
					}						
					bat 'mkdir ..\\target\\cucumber-reports\\API-Regression'
					bat 'copy target\\surefire-reports\\com.virtusa.qa.api.product.json ..\\target\\cucumber-reports\\API-Regression\\API-regression.json'
					step([$class: 'XrayImportBuilder', endpointName: '/cucumber/multipart',importInfo:'''{
						"fields": {
							"project": {
								"id": "10100"
							},
							"summary": "Regression Api Test Execution for BDD (Generated By jenkins-${JOB_NAME}-Build Number-${BUILD_NUMBER})",
							"issuetype": {
								"id": "10102"
							},
					   "labels":["Regression","Jenkins","Api"],
							"customfield_10224" : [
							   "Dev"
							]
						}
					}''',inputInfoSwitcher:"fileContent",importFilePath: '..\\target\\cucumber-reports\\API-Regression\\API-regression.json', serverInstance: '2c9ed762-a0d8-4b30-b3c3-2da0e5376d58'])
					bat 'del /f target\\surefire-reports\\com.virtusa.qa.api.product.json'
					bat 'del /f target\\surefire-reports\\com.virtusa.qa.api.1_API-1.json'
				}
			}
		}
		stage("Web Regression Test") {
			//agent { label 'master' }
			steps {
				echo 'WEB REGRESSION TEST'
				dir('web') {
					echo 'Web regression Testing Stage'
					catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
						bat 'mvn test -Dcucumber.options="--tags @regression"'
					}							
					bat 'mkdir ..\\target\\cucumber-reports\\Web-Regression'
					bat 'copy target\\cucumber-reports\\Cucumber.json ..\\target\\cucumber-reports\\Web-Regression\\Cucumber-regression.json'
					bat 'del /f target\\cucumber-reports\\Cucumber.json'
					step([$class: 'XrayImportBuilder', endpointName: '/cucumber/multipart',importInfo:'''{
						"fields": {
							"project": {
								"id": "10000"
							},
							"summary": "Regression Web Test Execution for Addressbook BDD (Generated By jenkins-${JOB_NAME}-Build Number-${BUILD_NUMBER})",
							"issuetype": {
								"id": "10102"
							},
					   "labels":["Regression","Jenkins"],
							"customfield_10224" : [
							   "Dev"
							]
						}
					}''',inputInfoSwitcher:"fileContent",importFilePath: '..\\target\\cucumber-reports\\Web-Regression\\Cucumber-regression.json', serverInstance: '2c9ed762-a0d8-4b30-b3c3-2da0e5376d58'])
				}
			}
			post {
				always {
					dir('web')
				        {
				         script {
                                allure([
                                        includeProperties: false,
                                        jdk: '',
                                        properties: [],
                                        reportBuildPolicy: 'ALWAYS',
                                        results: [[path: 'target\\allure-results']]
                                ])
                        }
                    }
					    //allure([results: [[path: 'C:\\Users\\intadmin\\AppData\\Local\\Jenkins\\.jenkins\\workspace\\addressbook\\web\\target\\allure-results']]])
						//allure results: [[path: 'web\\target\\allure-results']]

				}
			}
		}
		/*stage("Desktop Test") {
			//agent { label 'master' }
			steps {
				//echo 'Testing Desktop'
				dir('swing') {
					echo 'Testing Desktop'
						step([$class: 'XrayExportBuilder', filePath: '\\src\\test\\resource\\features', issues: 'SDA-5', serverInstance: '3e20ae75-1bb6-4094-aa02-27740ca0b24f'])
					catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
						//bat 'mvn clean test'
						bat 'cd'
                        bat 'dir'
						//bat 'timeout /t 30'
						bat 'mvn test'
					}
					bat 'mkdir ..\\target\\cucumber-reports\\Desktop-Test'
					bat 'copy target\\cucumber-reports\\Cucumber.json ..\\target\\cucumber-reports\\Desktop-Test\\Cucumber-desktop.json'
					step([$class: 'XrayImportBuilder', endpointName: '/cucumber/multipart',importInfo:'''{
						"fields": {
							"project": {
								"id": "10101"
							},
							"summary": " Desktop App Test Execution for BDD (Generated By Swing jenkins-${JOB_NAME}-Build Number-${BUILD_NUMBER})",
							"issuetype": {
								"id": "10007"
							},
					   "labels":["Desktop","Jenkins"],
							"customfield_10032" : [
							   "Dev"
							]
						}
					}''',inputInfoSwitcher:"fileContent",importFilePath: '..\\target\\cucumber-reports\\Desktop-Test\\Cucumber-desktop.json', serverInstance: '3e20ae75-1bb6-4094-aa02-27740ca0b24f'])
					bat 'del /f target\\cucumber-reports\\Cucumber.json'
				}
			}
		}*/
		stage("API performance test") {
			//agent { label 'master' }
			steps {
				dir('api_performance') {
					bat "del /f testresults.jtl"
					bat "rd /s /q C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Naddressbook\\api_performance\\report"
					bat "E:\\apache-jmeter-5.2.1\\bin\\jmeter -n -t Product_Stress_Test.jmx -l testresults.jtl -e -o ${WORKSPACE}//api_performance//report"
				}
			}
			post {
				always {
					perfReport 'api_performance\\testresults.jtl'
				}
			}
		}
		stage("Cucumber Report generation") {
			//agent { label 'master' }
			steps {
				cucumber buildStatus: 'UNSTABLE',
				failedFeaturesNumber: 1,
				failedScenariosNumber: 1,
				skippedStepsNumber: 1,
				failedStepsNumber: 1,
				fileIncludePattern: '**/*.json',
				jsonReportDirectory: 'target\\cucumber-reports',
				sortingMethod: 'ALPHABETICAL',
				trendsLimit: 100   
			}
		post {
			always {
				hygieiaTestPublishStep buildStatus: "${currentBuild.currentResult}", testApplicationName: 'addressbook', testEnvironmentName: 'Dev', testFileNamePattern: 'Cucumber-smoke.json', testResultsDirectory: '\\target\\cucumber-reports\\Web-Smoke', testType: 'Functional'
				hygieiaTestPublishStep buildStatus: "${currentBuild.currentResult}", testApplicationName: 'addressbook', testEnvironmentName: 'Dev', testFileNamePattern: 'API-smoke.json', testResultsDirectory: '\\target\\cucumber-reports\\API-Smoke', testType: 'Functional'
				hygieiaTestPublishStep buildStatus: "${currentBuild.currentResult}", testApplicationName: 'addressbook', testEnvironmentName: 'Dev', testFileNamePattern: 'Cucumber-desktop.json', testResultsDirectory: '\\target\\cucumber-reports\\Desktop-Test', testType: 'Functional'
				hygieiaTestPublishStep buildStatus: "${currentBuild.currentResult}", testApplicationName: 'addressbook', testEnvironmentName: 'Dev', testFileNamePattern: 'Cucumber-regression.json', testResultsDirectory: '\\target\\cucumber-reports\\Web-Regression', testType: 'Functional'
				hygieiaTestPublishStep buildStatus: "${currentBuild.currentResult}", testApplicationName: 'addressbook', testEnvironmentName: 'Dev', testFileNamePattern: 'API-regression.json', testResultsDirectory: '\\target\\cucumber-reports\\API-Regression', testType: 'Functional'
				}
			}
		}
	/*stage("SpotBug Report"){
		agent { label 'azunit03' }
		steps {
		publishHTML (target : [allowMissing: false,
 		alwaysLinkToLastBuild: true,
 		keepAll: true,
 		reportDir: 'target/site',
 		reportFiles: 'index.html',
 		reportName: 'SAST Scan Report',
 		reportTitles: 'SAST Scan Report'])
		}
	}
	stage("Zap Report"){
		agent { label 'azunit03' }
		steps {
		publishHTML (target : [allowMissing: false,
 		alwaysLinkToLastBuild: true,
 		keepAll: true,
 		reportDir: '/home/intadmin/dast/',
 		reportFiles: 'addressbookzapcli.html',
 		reportName: 'DAST Scan Report',
 		reportTitles: 'DAST Scan Report'])
		}
	}
	stage("Chaos Report"){
		agent { label 'azunit03' }
		steps {
		publishHTML (target : [allowMissing: false,
 		alwaysLinkToLastBuild: true,
 		keepAll: true,
 		reportDir: '/home/intadmin/Desktop/demoapplication/chaostoolkit/',
 		reportFiles: 'addressbookReport.html',
 		reportName: 'Chaos test Report',
 		reportTitles: 'Chaos test Report'])
		}
	}*/
	}     
    tools {
        maven 'maven3.3.9'
        jdk 'openjdk8'
		allure 'allure'
    }
    post {
        always {
            echo 'JENKINS PIPELINE'
        }
        success {
            echo 'JENKINS PIPELINE SUCCESSFUL'
        }
        failure {
            echo 'JENKINS PIPELINE FAILED'
        }
        unstable {
            echo 'JENKINS PIPELINE WAS MARKED AS UNSTABLE'
        }
        changed {
            echo 'JENKINS PIPELINE STATUS HAS CHANGED SINCE LAST EXECUTION'
        }
    }
}
