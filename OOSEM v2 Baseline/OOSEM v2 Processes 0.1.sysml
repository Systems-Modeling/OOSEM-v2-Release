  /*  OOSEM v2 Processes Model 
   * 
   *  Version 0.1
   *  Published 2026-09-03
   *
   *  Copyright 2026 Sanford Friedenthal 
   * 
   *  Licensed under the Apache License, Version 2.0 (the "License");
   *  you may not use this model except in compliance with the License.
   *  You may obtain a copy of the License at
   * 
   *      https://www.apache.org/licenses/LICENSE-2.0
   * 
   *  Unless required by applicable law or agreed to in writing, software
   *  distributed under the License is distributed on an "AS IS" BASIS,
   *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   *  See the License for the specific language governing permissions and
   *  limitations under the License.
   * 
   * ===========================================================================================
   * 
   *  OOSEM v2 Processes Model
   * 
   *  The Object-Oriented Systems Engineering Method (OOSEM) is a model-based systems engineering 
   *  method to specify, architect, analyze, and verify systems. OOSEM applies a scenario-driven 
   *  decomposition approach coupled with the principle of separation of concerns to develop a 
   *  model of the system (e.g., the system model). OOSEM was originally developed using SysML v1.  
   *  OOSEM v2 leverages SysML v2 to provide more efficient modeling and improved traceability.
   *
   *  OOSEM is intended to be used as a reference methodology that can be adapted and tailored to 
   *  meet the needs of the project. The OOSEM process model contains the basic OOSEM activities 
   *  along with their inputs and outputs. The activities can be assembled into a specific process 
   *  for a particular application. The tailoring of the process should consider the lifecycle 
   *  phase, project size, application domain, design-level, breadth of trade space, team  
   *  experience, cost and schedule constraints, etc. Typical tailoring includes:
   * 
   *  - Identifying which processes and modeling artifacts are needed and their level of detail
   *  - Aligning terminology of processes and artifacts
   *  - Defining the project lifecycle model and the associated sequencing of actions
   *  - Allocating actions and artifacts to organization structure, roles and/or work packages
   *
   *  The OOSEM v2 slides available at https://github.com/Systems-Modeling/ 
   *  provide an introduction to OOSEM including a graphical depiction of the activities.
   * 
   *  This work is intended to support a collaborative effort between the OMG Systems Modeling 
   *  Community (SMC) and the INCOSE OOSEM Working Group.
   */

    package 'OOSEM v2 Processes' {
        package Actions {
            package LifecycleProcess {
                action 'perform system lifecycle process' {
                    action 'manage system lifecycle ';
                    action 'develop system';
                    action 'manufacture system';
                    action 'deploy system';
                    action 'operate system';
                    action 'support system';
                    action 'retire system';

                    action 'develop operational system' :> 'develop system';
                    action 'develop verification system' :> 'develop system';
                    action 'develop installation system' :> 'develop system';
                }
            }
            package DevelopProcess {
                action <del> 'develop element' {
                    action 'manage element development';
                    action 'specify & design element';
                    action 'develop SubElements ' [*] {
                        action manage;
                        action 'specify & design';
                        action 'develop next level';
                        action 'assemble integ & test';
                    }
                    action 'assemble integrate & test element';
                }
                action <ds> 'develop system' {
                    in item 'project requirements';
                    out item 'system development status';
                    out item 'system development baseline';
                    action 'manage system development' :> msd;
                    action 'specify and design system' :> sds;
                    action 'develop elements' [*] :> del {
                        action 'develop hw';
                        action 'develop sw';
                    }
                    action 'assemble, integrate and test system' :> aits;
                    comment about 'develop elements'
                    /* At leaf level, each develop element process is replaced by:
                     * - perform detailed element design and implementaiton 
                     * or 
                     * - select and aquire element
                     */
                }
                action <msd> 'manage system develpment' {
                    in item 'project requirements';
                    /* statement of work */
                    out item 'system development status';
                    out item 'system development baseline';
                    out item 'system development plan';
                    in item 'technical status';
                    in item 'proposed baseline updates';
                    action 'monitor status';
                    action 'review baseline';
                    action 'manage issues and risk';
                    action 'develop plan' :> dp;
                    action 'manage configuration';
                    action 'manage modeling environment and practice' :> mmep;
                }
                action <dp> 'develop plan' {
                    action 'establsih modeling objectives and scope';
                    action 'identify stakeholders, viewpoints, and views';
                    action 'define lifecycle process';
                    action 'identify work products and maturity milestones';
                    action 'tailor process and methods';
                    action 'establish roles and responsibilities';
                }
                action <mmep> 'manage system development environment and practice' {
                    action 'establish modeling conventions and standards';
                    action 'organize model';
                    action 'manage tools';
                    action 'manage skills';
                }
                action <sds> 'specify and design system' {
                    in item 'approved system specification and design baseline';
                    in item 'system specification and design plan';
                    out item 'technical status';
                    out item 'system specification and design baseline updates';
                    action 'analyze stakeholder needs' :> asn;
                    action 'analyze system requirements' :> asr;
                    action 'define logical architecture' :> dla;
                    action 'synthesize candidate physical architectures' :> scpa;
                    action 'optimize and evaluate alternatives' :> oea;
                    action 'verify system design' :> vsd;
                    action 'manage requirements traceability' :> mrt;
                    action 'define transition plan';
                }
                action <asn> 'analyze stakeholder needs' {
                    in item stakeholders;
                    in item 'as-is enterprise documentation';
                    out item 'stakeholder viewpoints';
                    out item 'integrated stakeholder needs';
                    out item 'enterprise use cases';
                    out item 'measures of effectiveness';
                    out item 'enterprise requirements';
                    action 'characterize as-Is system and enterprise';
                    action 'identify stakeholder viewpoints';
                    action 'perform causal and needs analysis';
                    action 'identify enterprise use cases';
                    action 'identify measures of effectiveness';
                    action 'specify enterprise requirements';
                }
                action <asr> 'analyze system requirements' {
                    in item enterpriseUseCases;
                    in item 'measures of effectiveness';
                    out item 'use case scenarios';
                    out item 'system context';
                    out item 'system blackbox';
                    out item 'system requirements';
                    out item 'requirements variation analysis';
                    action 'analyze enterprise use case scenarios';
                    action 'define system context';
                    action 'define system state based behavior';
                    action 'identify critcial system properties';
                    action 'capture system design constraints';
                    action 'analyze system requirements variation';
                    action 'define system blackbox';
                    action 'specify system requirements';
                }
                action <dla> 'define logical architecture' {
                    in item 'system blackbox';
                    out item 'system logical architecture';
                    action 'define logical decomposition';
                    action 'define logical component interconnection';
                    action 'define logical component behavior';
                }
                action <scpa> 'synthesize candidate physical architectures' {
                    in item 'system black box';
                    in item 'system logical architecture';
                    in item 'analysis results';
                    in item 'element designs';
                    out item 'candidate system physical architecures';
                    out item 'element blackboxes';
                    out item 'element requirements';
                    action 'define partitioning criteria';
                    action 'define logical node architecture';
                    action 'allocate logical components to physical elements';
                    action 'define system physical architecture';
                    action 'define software architecture';
                    action 'define data architecture';
                    action 'define hardware architecture';
                    action 'define specialty architecture';
                    action 'identify operational procedures';
                    action 'specify element blackbox';
                    action 'specify element requirements';
                    action 'integrate next level element design';
                }
                action <oea> 'optimize and evaluate alternatives' {
                    in item 'system requirements';
                    in item 'candidate system physical architectures';
                    out item 'analysis cases';
                    out item 'analysis results';
                    action 'identify analysis to be performed';
                    action 'specify analysis';
                    action 'perform analysis';
                    action 'integrate analysis results';
                }
                action <vsd> 'verify system design' {
                    in item 'system requirements';
                    in item 'system physical architecture';
                    out item 'verification cases';
                    out item 'verification plan';
                    out item 'verification results';
                    action 'identify requirements to be verified';
                    action 'specify verification cases';
                    action 'develop verification plan';
                    action 'execute verfication cases';
                }
                action <mrt> 'manage requirements traceability' {
                    in item 'enterprise requirements';
                    in item 'system requirements';
                    in item 'element requirements';
                    in item 'system physical architecture';
                    in item 'analysis cases';
                    in item 'analysis results';
                    in item 'verification cases';
                    in item 'verification results';
                    out item 'requirements traceability matrix';
                    out item 'traceability gaps';
                    action 'define specification tree';
                    action 'establish requirement relationships and rationale';
                    action 'identify and analyze traceability gaps';
                }
                action <aits> 'assemble integrate and test system';
            }
        }
    }