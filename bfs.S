
bfs.o:     file format elf64-x86-64


Disassembly of section .init:

0000000000002000 <_init>:
    2000:	f3 0f 1e fa          	endbr64 
    2004:	48 83 ec 08          	sub    $0x8,%rsp
    2008:	48 8b 05 d9 5f 00 00 	mov    0x5fd9(%rip),%rax        # 7fe8 <__gmon_start__>
    200f:	48 85 c0             	test   %rax,%rax
    2012:	74 02                	je     2016 <_init+0x16>
    2014:	ff d0                	callq  *%rax
    2016:	48 83 c4 08          	add    $0x8,%rsp
    201a:	c3                   	retq   

Disassembly of section .plt:

0000000000002020 <.plt>:
    2020:	ff 35 8a 5e 00 00    	pushq  0x5e8a(%rip)        # 7eb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    2026:	f2 ff 25 8b 5e 00 00 	bnd jmpq *0x5e8b(%rip)        # 7eb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    202d:	0f 1f 00             	nopl   (%rax)
    2030:	f3 0f 1e fa          	endbr64 
    2034:	68 00 00 00 00       	pushq  $0x0
    2039:	f2 e9 e1 ff ff ff    	bnd jmpq 2020 <.plt>
    203f:	90                   	nop
    2040:	f3 0f 1e fa          	endbr64 
    2044:	68 01 00 00 00       	pushq  $0x1
    2049:	f2 e9 d1 ff ff ff    	bnd jmpq 2020 <.plt>
    204f:	90                   	nop
    2050:	f3 0f 1e fa          	endbr64 
    2054:	68 02 00 00 00       	pushq  $0x2
    2059:	f2 e9 c1 ff ff ff    	bnd jmpq 2020 <.plt>
    205f:	90                   	nop
    2060:	f3 0f 1e fa          	endbr64 
    2064:	68 03 00 00 00       	pushq  $0x3
    2069:	f2 e9 b1 ff ff ff    	bnd jmpq 2020 <.plt>
    206f:	90                   	nop
    2070:	f3 0f 1e fa          	endbr64 
    2074:	68 04 00 00 00       	pushq  $0x4
    2079:	f2 e9 a1 ff ff ff    	bnd jmpq 2020 <.plt>
    207f:	90                   	nop
    2080:	f3 0f 1e fa          	endbr64 
    2084:	68 05 00 00 00       	pushq  $0x5
    2089:	f2 e9 91 ff ff ff    	bnd jmpq 2020 <.plt>
    208f:	90                   	nop
    2090:	f3 0f 1e fa          	endbr64 
    2094:	68 06 00 00 00       	pushq  $0x6
    2099:	f2 e9 81 ff ff ff    	bnd jmpq 2020 <.plt>
    209f:	90                   	nop
    20a0:	f3 0f 1e fa          	endbr64 
    20a4:	68 07 00 00 00       	pushq  $0x7
    20a9:	f2 e9 71 ff ff ff    	bnd jmpq 2020 <.plt>
    20af:	90                   	nop
    20b0:	f3 0f 1e fa          	endbr64 
    20b4:	68 08 00 00 00       	pushq  $0x8
    20b9:	f2 e9 61 ff ff ff    	bnd jmpq 2020 <.plt>
    20bf:	90                   	nop
    20c0:	f3 0f 1e fa          	endbr64 
    20c4:	68 09 00 00 00       	pushq  $0x9
    20c9:	f2 e9 51 ff ff ff    	bnd jmpq 2020 <.plt>
    20cf:	90                   	nop
    20d0:	f3 0f 1e fa          	endbr64 
    20d4:	68 0a 00 00 00       	pushq  $0xa
    20d9:	f2 e9 41 ff ff ff    	bnd jmpq 2020 <.plt>
    20df:	90                   	nop
    20e0:	f3 0f 1e fa          	endbr64 
    20e4:	68 0b 00 00 00       	pushq  $0xb
    20e9:	f2 e9 31 ff ff ff    	bnd jmpq 2020 <.plt>
    20ef:	90                   	nop
    20f0:	f3 0f 1e fa          	endbr64 
    20f4:	68 0c 00 00 00       	pushq  $0xc
    20f9:	f2 e9 21 ff ff ff    	bnd jmpq 2020 <.plt>
    20ff:	90                   	nop
    2100:	f3 0f 1e fa          	endbr64 
    2104:	68 0d 00 00 00       	pushq  $0xd
    2109:	f2 e9 11 ff ff ff    	bnd jmpq 2020 <.plt>
    210f:	90                   	nop
    2110:	f3 0f 1e fa          	endbr64 
    2114:	68 0e 00 00 00       	pushq  $0xe
    2119:	f2 e9 01 ff ff ff    	bnd jmpq 2020 <.plt>
    211f:	90                   	nop
    2120:	f3 0f 1e fa          	endbr64 
    2124:	68 0f 00 00 00       	pushq  $0xf
    2129:	f2 e9 f1 fe ff ff    	bnd jmpq 2020 <.plt>
    212f:	90                   	nop
    2130:	f3 0f 1e fa          	endbr64 
    2134:	68 10 00 00 00       	pushq  $0x10
    2139:	f2 e9 e1 fe ff ff    	bnd jmpq 2020 <.plt>
    213f:	90                   	nop
    2140:	f3 0f 1e fa          	endbr64 
    2144:	68 11 00 00 00       	pushq  $0x11
    2149:	f2 e9 d1 fe ff ff    	bnd jmpq 2020 <.plt>
    214f:	90                   	nop
    2150:	f3 0f 1e fa          	endbr64 
    2154:	68 12 00 00 00       	pushq  $0x12
    2159:	f2 e9 c1 fe ff ff    	bnd jmpq 2020 <.plt>
    215f:	90                   	nop
    2160:	f3 0f 1e fa          	endbr64 
    2164:	68 13 00 00 00       	pushq  $0x13
    2169:	f2 e9 b1 fe ff ff    	bnd jmpq 2020 <.plt>
    216f:	90                   	nop
    2170:	f3 0f 1e fa          	endbr64 
    2174:	68 14 00 00 00       	pushq  $0x14
    2179:	f2 e9 a1 fe ff ff    	bnd jmpq 2020 <.plt>
    217f:	90                   	nop
    2180:	f3 0f 1e fa          	endbr64 
    2184:	68 15 00 00 00       	pushq  $0x15
    2189:	f2 e9 91 fe ff ff    	bnd jmpq 2020 <.plt>
    218f:	90                   	nop
    2190:	f3 0f 1e fa          	endbr64 
    2194:	68 16 00 00 00       	pushq  $0x16
    2199:	f2 e9 81 fe ff ff    	bnd jmpq 2020 <.plt>
    219f:	90                   	nop
    21a0:	f3 0f 1e fa          	endbr64 
    21a4:	68 17 00 00 00       	pushq  $0x17
    21a9:	f2 e9 71 fe ff ff    	bnd jmpq 2020 <.plt>
    21af:	90                   	nop
    21b0:	f3 0f 1e fa          	endbr64 
    21b4:	68 18 00 00 00       	pushq  $0x18
    21b9:	f2 e9 61 fe ff ff    	bnd jmpq 2020 <.plt>
    21bf:	90                   	nop
    21c0:	f3 0f 1e fa          	endbr64 
    21c4:	68 19 00 00 00       	pushq  $0x19
    21c9:	f2 e9 51 fe ff ff    	bnd jmpq 2020 <.plt>
    21cf:	90                   	nop
    21d0:	f3 0f 1e fa          	endbr64 
    21d4:	68 1a 00 00 00       	pushq  $0x1a
    21d9:	f2 e9 41 fe ff ff    	bnd jmpq 2020 <.plt>
    21df:	90                   	nop
    21e0:	f3 0f 1e fa          	endbr64 
    21e4:	68 1b 00 00 00       	pushq  $0x1b
    21e9:	f2 e9 31 fe ff ff    	bnd jmpq 2020 <.plt>
    21ef:	90                   	nop
    21f0:	f3 0f 1e fa          	endbr64 
    21f4:	68 1c 00 00 00       	pushq  $0x1c
    21f9:	f2 e9 21 fe ff ff    	bnd jmpq 2020 <.plt>
    21ff:	90                   	nop
    2200:	f3 0f 1e fa          	endbr64 
    2204:	68 1d 00 00 00       	pushq  $0x1d
    2209:	f2 e9 11 fe ff ff    	bnd jmpq 2020 <.plt>
    220f:	90                   	nop
    2210:	f3 0f 1e fa          	endbr64 
    2214:	68 1e 00 00 00       	pushq  $0x1e
    2219:	f2 e9 01 fe ff ff    	bnd jmpq 2020 <.plt>
    221f:	90                   	nop
    2220:	f3 0f 1e fa          	endbr64 
    2224:	68 1f 00 00 00       	pushq  $0x1f
    2229:	f2 e9 f1 fd ff ff    	bnd jmpq 2020 <.plt>
    222f:	90                   	nop
    2230:	f3 0f 1e fa          	endbr64 
    2234:	68 20 00 00 00       	pushq  $0x20
    2239:	f2 e9 e1 fd ff ff    	bnd jmpq 2020 <.plt>
    223f:	90                   	nop

Disassembly of section .plt.got:

0000000000002240 <__cxa_finalize@plt>:
    2240:	f3 0f 1e fa          	endbr64 
    2244:	f2 ff 25 7d 5d 00 00 	bnd jmpq *0x5d7d(%rip)        # 7fc8 <__cxa_finalize@GLIBC_2.2.5>
    224b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000002250 <_Znam@plt>:
    2250:	f3 0f 1e fa          	endbr64 
    2254:	f2 ff 25 65 5c 00 00 	bnd jmpq *0x5c65(%rip)        # 7ec0 <_Znam@GLIBCXX_3.4>
    225b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002260 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv@plt>:
    2260:	f3 0f 1e fa          	endbr64 
    2264:	f2 ff 25 5d 5c 00 00 	bnd jmpq *0x5c5d(%rip)        # 7ec8 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv@GLIBCXX_3.4>
    226b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002270 <_ZNSolsEm@plt>:
    2270:	f3 0f 1e fa          	endbr64 
    2274:	f2 ff 25 55 5c 00 00 	bnd jmpq *0x5c55(%rip)        # 7ed0 <_ZNSolsEm@GLIBCXX_3.4>
    227b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002280 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@plt>:
    2280:	f3 0f 1e fa          	endbr64 
    2284:	f2 ff 25 4d 5c 00 00 	bnd jmpq *0x5c4d(%rip)        # 7ed8 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@GLIBCXX_3.4>
    228b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002290 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@plt>:
    2290:	f3 0f 1e fa          	endbr64 
    2294:	f2 ff 25 45 5c 00 00 	bnd jmpq *0x5c45(%rip)        # 7ee0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@GLIBCXX_3.4.21>
    229b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000022a0 <_ZSt17__throw_bad_allocv@plt>:
    22a0:	f3 0f 1e fa          	endbr64 
    22a4:	f2 ff 25 3d 5c 00 00 	bnd jmpq *0x5c3d(%rip)        # 7ee8 <_ZSt17__throw_bad_allocv@GLIBCXX_3.4>
    22ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000022b0 <__cxa_begin_catch@plt>:
    22b0:	f3 0f 1e fa          	endbr64 
    22b4:	f2 ff 25 35 5c 00 00 	bnd jmpq *0x5c35(%rip)        # 7ef0 <__cxa_begin_catch@CXXABI_1.3>
    22bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000022c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_@plt>:
    22c0:	f3 0f 1e fa          	endbr64 
    22c4:	f2 ff 25 2d 5c 00 00 	bnd jmpq *0x5c2d(%rip)        # 7ef8 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_@GLIBCXX_3.4.21>
    22cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000022d0 <_ZSt20__throw_length_errorPKc@plt>:
    22d0:	f3 0f 1e fa          	endbr64 
    22d4:	f2 ff 25 25 5c 00 00 	bnd jmpq *0x5c25(%rip)        # 7f00 <_ZSt20__throw_length_errorPKc@GLIBCXX_3.4>
    22db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000022e0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>:
    22e0:	f3 0f 1e fa          	endbr64 
    22e4:	f2 ff 25 1d 5c 00 00 	bnd jmpq *0x5c1d(%rip)        # 7f08 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@GLIBCXX_3.4.21>
    22eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000022f0 <__cxa_atexit@plt>:
    22f0:	f3 0f 1e fa          	endbr64 
    22f4:	f2 ff 25 15 5c 00 00 	bnd jmpq *0x5c15(%rip)        # 7f10 <__cxa_atexit@GLIBC_2.2.5>
    22fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002300 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>:
    2300:	f3 0f 1e fa          	endbr64 
    2304:	f2 ff 25 0d 5c 00 00 	bnd jmpq *0x5c0d(%rip)        # 7f18 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@GLIBCXX_3.4.21>
    230b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002310 <_ZdlPv@plt>:
    2310:	f3 0f 1e fa          	endbr64 
    2314:	f2 ff 25 05 5c 00 00 	bnd jmpq *0x5c05(%rip)        # 7f20 <_ZdlPv@GLIBCXX_3.4>
    231b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002320 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    2320:	f3 0f 1e fa          	endbr64 
    2324:	f2 ff 25 fd 5b 00 00 	bnd jmpq *0x5bfd(%rip)        # 7f28 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4>
    232b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002330 <_Znwm@plt>:
    2330:	f3 0f 1e fa          	endbr64 
    2334:	f2 ff 25 f5 5b 00 00 	bnd jmpq *0x5bf5(%rip)        # 7f30 <_Znwm@GLIBCXX_3.4>
    233b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002340 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@plt>:
    2340:	f3 0f 1e fa          	endbr64 
    2344:	f2 ff 25 ed 5b 00 00 	bnd jmpq *0x5bed(%rip)        # 7f38 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@GLIBCXX_3.4.21>
    234b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002350 <_ZNSolsEPFRSoS_E@plt>:
    2350:	f3 0f 1e fa          	endbr64 
    2354:	f2 ff 25 e5 5b 00 00 	bnd jmpq *0x5be5(%rip)        # 7f40 <_ZNSolsEPFRSoS_E@GLIBCXX_3.4>
    235b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002360 <_ZNSaIcED1Ev@plt>:
    2360:	f3 0f 1e fa          	endbr64 
    2364:	f2 ff 25 dd 5b 00 00 	bnd jmpq *0x5bdd(%rip)        # 7f48 <_ZNSaIcED1Ev@GLIBCXX_3.4>
    236b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002370 <__stack_chk_fail@plt>:
    2370:	f3 0f 1e fa          	endbr64 
    2374:	f2 ff 25 d5 5b 00 00 	bnd jmpq *0x5bd5(%rip)        # 7f50 <__stack_chk_fail@GLIBC_2.4>
    237b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002380 <exit@plt>:
    2380:	f3 0f 1e fa          	endbr64 
    2384:	f2 ff 25 cd 5b 00 00 	bnd jmpq *0x5bcd(%rip)        # 7f58 <exit@GLIBC_2.2.5>
    238b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002390 <_ZNSi4readEPcl@plt>:
    2390:	f3 0f 1e fa          	endbr64 
    2394:	f2 ff 25 c5 5b 00 00 	bnd jmpq *0x5bc5(%rip)        # 7f60 <_ZNSi4readEPcl@GLIBCXX_3.4>
    239b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023a0 <_ZdaPv@plt>:
    23a0:	f3 0f 1e fa          	endbr64 
    23a4:	f2 ff 25 bd 5b 00 00 	bnd jmpq *0x5bbd(%rip)        # 7f68 <_ZdaPv@GLIBCXX_3.4>
    23ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_@plt>:
    23b0:	f3 0f 1e fa          	endbr64 
    23b4:	f2 ff 25 b5 5b 00 00 	bnd jmpq *0x5bb5(%rip)        # 7f70 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_@GLIBCXX_3.4.21>
    23bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023c0 <__cxa_throw_bad_array_new_length@plt>:
    23c0:	f3 0f 1e fa          	endbr64 
    23c4:	f2 ff 25 ad 5b 00 00 	bnd jmpq *0x5bad(%rip)        # 7f78 <__cxa_throw_bad_array_new_length@CXXABI_1.3.8>
    23cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023d0 <__cxa_rethrow@plt>:
    23d0:	f3 0f 1e fa          	endbr64 
    23d4:	f2 ff 25 a5 5b 00 00 	bnd jmpq *0x5ba5(%rip)        # 7f80 <__cxa_rethrow@CXXABI_1.3>
    23db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023e0 <_ZNSt8ios_base4InitC1Ev@plt>:
    23e0:	f3 0f 1e fa          	endbr64 
    23e4:	f2 ff 25 9d 5b 00 00 	bnd jmpq *0x5b9d(%rip)        # 7f88 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    23eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023f0 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv@plt>:
    23f0:	f3 0f 1e fa          	endbr64 
    23f4:	f2 ff 25 95 5b 00 00 	bnd jmpq *0x5b95(%rip)        # 7f90 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv@GLIBCXX_3.4>
    23fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002400 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@plt>:
    2400:	f3 0f 1e fa          	endbr64 
    2404:	f2 ff 25 8d 5b 00 00 	bnd jmpq *0x5b8d(%rip)        # 7f98 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@GLIBCXX_3.4.21>
    240b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002410 <memmove@plt>:
    2410:	f3 0f 1e fa          	endbr64 
    2414:	f2 ff 25 85 5b 00 00 	bnd jmpq *0x5b85(%rip)        # 7fa0 <memmove@GLIBC_2.2.5>
    241b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002420 <__cxa_end_catch@plt>:
    2420:	f3 0f 1e fa          	endbr64 
    2424:	f2 ff 25 7d 5b 00 00 	bnd jmpq *0x5b7d(%rip)        # 7fa8 <__cxa_end_catch@CXXABI_1.3>
    242b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002430 <_Unwind_Resume@plt>:
    2430:	f3 0f 1e fa          	endbr64 
    2434:	f2 ff 25 75 5b 00 00 	bnd jmpq *0x5b75(%rip)        # 7fb0 <_Unwind_Resume@GCC_3.0>
    243b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002440 <_ZNSaIcEC1Ev@plt>:
    2440:	f3 0f 1e fa          	endbr64 
    2444:	f2 ff 25 6d 5b 00 00 	bnd jmpq *0x5b6d(%rip)        # 7fb8 <_ZNSaIcEC1Ev@GLIBCXX_3.4>
    244b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002450 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEcm@plt>:
    2450:	f3 0f 1e fa          	endbr64 
    2454:	f2 ff 25 65 5b 00 00 	bnd jmpq *0x5b65(%rip)        # 7fc0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEcm@GLIBCXX_3.4.21>
    245b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000002460 <_start>:
    2460:	f3 0f 1e fa          	endbr64 
    2464:	31 ed                	xor    %ebp,%ebp
    2466:	49 89 d1             	mov    %rdx,%r9
    2469:	5e                   	pop    %rsi
    246a:	48 89 e2             	mov    %rsp,%rdx
    246d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    2471:	50                   	push   %rax
    2472:	54                   	push   %rsp
    2473:	4c 8d 05 66 2b 00 00 	lea    0x2b66(%rip),%r8        # 4fe0 <__libc_csu_fini>
    247a:	48 8d 0d ef 2a 00 00 	lea    0x2aef(%rip),%rcx        # 4f70 <__libc_csu_init>
    2481:	48 8d 3d 9f 04 00 00 	lea    0x49f(%rip),%rdi        # 2927 <main>
    2488:	ff 15 52 5b 00 00    	callq  *0x5b52(%rip)        # 7fe0 <__libc_start_main@GLIBC_2.2.5>
    248e:	f4                   	hlt    
    248f:	90                   	nop

0000000000002490 <deregister_tm_clones>:
    2490:	48 8d 3d 81 5b 00 00 	lea    0x5b81(%rip),%rdi        # 8018 <__TMC_END__>
    2497:	48 8d 05 7a 5b 00 00 	lea    0x5b7a(%rip),%rax        # 8018 <__TMC_END__>
    249e:	48 39 f8             	cmp    %rdi,%rax
    24a1:	74 15                	je     24b8 <deregister_tm_clones+0x28>
    24a3:	48 8b 05 2e 5b 00 00 	mov    0x5b2e(%rip),%rax        # 7fd8 <_ITM_deregisterTMCloneTable>
    24aa:	48 85 c0             	test   %rax,%rax
    24ad:	74 09                	je     24b8 <deregister_tm_clones+0x28>
    24af:	ff e0                	jmpq   *%rax
    24b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    24b8:	c3                   	retq   
    24b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000024c0 <register_tm_clones>:
    24c0:	48 8d 3d 51 5b 00 00 	lea    0x5b51(%rip),%rdi        # 8018 <__TMC_END__>
    24c7:	48 8d 35 4a 5b 00 00 	lea    0x5b4a(%rip),%rsi        # 8018 <__TMC_END__>
    24ce:	48 29 fe             	sub    %rdi,%rsi
    24d1:	48 89 f0             	mov    %rsi,%rax
    24d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    24d8:	48 c1 f8 03          	sar    $0x3,%rax
    24dc:	48 01 c6             	add    %rax,%rsi
    24df:	48 d1 fe             	sar    %rsi
    24e2:	74 14                	je     24f8 <register_tm_clones+0x38>
    24e4:	48 8b 05 05 5b 00 00 	mov    0x5b05(%rip),%rax        # 7ff0 <_ITM_registerTMCloneTable>
    24eb:	48 85 c0             	test   %rax,%rax
    24ee:	74 08                	je     24f8 <register_tm_clones+0x38>
    24f0:	ff e0                	jmpq   *%rax
    24f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    24f8:	c3                   	retq   
    24f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002500 <__do_global_dtors_aux>:
    2500:	f3 0f 1e fa          	endbr64 
    2504:	80 3d 45 5c 00 00 00 	cmpb   $0x0,0x5c45(%rip)        # 8150 <completed.8060>
    250b:	75 2b                	jne    2538 <__do_global_dtors_aux+0x38>
    250d:	55                   	push   %rbp
    250e:	48 83 3d b2 5a 00 00 	cmpq   $0x0,0x5ab2(%rip)        # 7fc8 <__cxa_finalize@GLIBC_2.2.5>
    2515:	00 
    2516:	48 89 e5             	mov    %rsp,%rbp
    2519:	74 0c                	je     2527 <__do_global_dtors_aux+0x27>
    251b:	48 8b 3d e6 5a 00 00 	mov    0x5ae6(%rip),%rdi        # 8008 <__dso_handle>
    2522:	e8 19 fd ff ff       	callq  2240 <__cxa_finalize@plt>
    2527:	e8 64 ff ff ff       	callq  2490 <deregister_tm_clones>
    252c:	c6 05 1d 5c 00 00 01 	movb   $0x1,0x5c1d(%rip)        # 8150 <completed.8060>
    2533:	5d                   	pop    %rbp
    2534:	c3                   	retq   
    2535:	0f 1f 00             	nopl   (%rax)
    2538:	c3                   	retq   
    2539:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002540 <frame_dummy>:
    2540:	f3 0f 1e fa          	endbr64 
    2544:	e9 77 ff ff ff       	jmpq   24c0 <register_tm_clones>

0000000000002549 <_Z17PIN_updateCurrDstj>:
    2549:	f3 0f 1e fa          	endbr64 
    254d:	55                   	push   %rbp
    254e:	48 89 e5             	mov    %rsp,%rbp
    2551:	89 7d fc             	mov    %edi,-0x4(%rbp)
    2554:	90                   	nop
    2555:	5d                   	pop    %rbp
    2556:	c3                   	retq   

0000000000002557 <_Z22PIN_updateRegBaseBoundmm>:
    2557:	f3 0f 1e fa          	endbr64 
    255b:	55                   	push   %rbp
    255c:	48 89 e5             	mov    %rsp,%rbp
    255f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2563:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2567:	90                   	nop
    2568:	5d                   	pop    %rbp
    2569:	c3                   	retq   

000000000000256a <_Z18PIN_registerGraphsPcj>:
    256a:	f3 0f 1e fa          	endbr64 
    256e:	55                   	push   %rbp
    256f:	48 89 e5             	mov    %rsp,%rbp
    2572:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2576:	89 75 f4             	mov    %esi,-0xc(%rbp)
    2579:	90                   	nop
    257a:	5d                   	pop    %rbp
    257b:	c3                   	retq   

000000000000257c <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE>:
    257c:	f3 0f 1e fa          	endbr64 
    2580:	55                   	push   %rbp
    2581:	48 89 e5             	mov    %rsp,%rbp
    2584:	53                   	push   %rbx
    2585:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    258c:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
    2593:	89 b5 74 ff ff ff    	mov    %esi,-0x8c(%rbp)
    2599:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
    25a0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    25a7:	00 00 
    25a9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    25ad:	31 c0                	xor    %eax,%eax
    25af:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    25b5:	48 63 d0             	movslq %eax,%rdx
    25b8:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    25bf:	48 89 d6             	mov    %rdx,%rsi
    25c2:	48 89 c7             	mov    %rax,%rdi
    25c5:	e8 12 07 00 00       	callq  2cdc <_ZNSt6vectorIiSaIiEEixEm>
    25ca:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    25d0:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    25d4:	48 89 c7             	mov    %rax,%rdi
    25d7:	e8 c0 06 00 00       	callq  2c9c <_ZNSt6vectorIiSaIiEEC1Ev>
    25dc:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
    25e3:	48 89 c7             	mov    %rax,%rdi
    25e6:	e8 fb 07 00 00       	callq  2de6 <_ZNK8CSRGraphIiiLb1EE9num_nodesEv>
    25eb:	48 89 c2             	mov    %rax,%rdx
    25ee:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    25f2:	48 89 d6             	mov    %rdx,%rsi
    25f5:	48 89 c7             	mov    %rax,%rdi
    25f8:	e8 45 08 00 00       	callq  2e42 <_ZNSt6vectorIiSaIiEE7reserveEm>
    25fd:	48 8d 95 74 ff ff ff 	lea    -0x8c(%rbp),%rdx
    2604:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    2608:	48 89 d6             	mov    %rdx,%rsi
    260b:	48 89 c7             	mov    %rax,%rdi
    260e:	e8 c1 09 00 00       	callq  2fd4 <_ZNSt6vectorIiSaIiEE9push_backERKi>
    2613:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    2617:	48 89 c7             	mov    %rax,%rdi
    261a:	e8 35 0a 00 00       	callq  3054 <_ZNSt6vectorIiSaIiEE5beginEv>
    261f:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    2623:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    2627:	48 89 c7             	mov    %rax,%rdi
    262a:	e8 71 0a 00 00       	callq  30a0 <_ZNSt6vectorIiSaIiEE3endEv>
    262f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2633:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
    2637:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    263b:	48 89 d6             	mov    %rdx,%rsi
    263e:	48 89 c7             	mov    %rax,%rdi
    2641:	e8 aa 0a 00 00       	callq  30f0 <_ZN9__gnu_cxxneIPiSt6vectorIiSaIiEEEEbRKNS_17__normal_iteratorIT_T0_EESA_>
    2646:	84 c0                	test   %al,%al
    2648:	0f 84 03 01 00 00    	je     2751 <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE+0x1d5>
    264e:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    2652:	48 89 c7             	mov    %rax,%rdi
    2655:	e8 3c 0b 00 00       	callq  3196 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv>
    265a:	8b 00                	mov    (%rax),%eax
    265c:	89 45 8c             	mov    %eax,-0x74(%rbp)
    265f:	8b 45 8c             	mov    -0x74(%rbp),%eax
    2662:	89 c7                	mov    %eax,%edi
    2664:	e8 e0 fe ff ff       	callq  2549 <_Z17PIN_updateCurrDstj>
    2669:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    266d:	8b 55 8c             	mov    -0x74(%rbp),%edx
    2670:	48 8b b5 78 ff ff ff 	mov    -0x88(%rbp),%rsi
    2677:	b9 00 00 00 00       	mov    $0x0,%ecx
    267c:	48 89 c7             	mov    %rax,%rdi
    267f:	e8 28 0b 00 00       	callq  31ac <_ZNK8CSRGraphIiiLb1EE9out_neighEim>
    2684:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    2688:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    268c:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    2690:	48 89 c7             	mov    %rax,%rdi
    2693:	e8 50 0b 00 00       	callq  31e8 <_ZN8CSRGraphIiiLb1EE12Neighborhood5beginEv>
    2698:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    269c:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    26a0:	48 89 c7             	mov    %rax,%rdi
    26a3:	e8 78 0b 00 00       	callq  3220 <_ZN8CSRGraphIiiLb1EE12Neighborhood3endEv>
    26a8:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    26ac:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    26b0:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
    26b4:	0f 84 81 00 00 00    	je     273b <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE+0x1bf>
    26ba:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    26be:	8b 00                	mov    (%rax),%eax
    26c0:	89 45 88             	mov    %eax,-0x78(%rbp)
    26c3:	8b 45 88             	mov    -0x78(%rbp),%eax
    26c6:	48 63 d0             	movslq %eax,%rdx
    26c9:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    26d0:	48 89 d6             	mov    %rdx,%rsi
    26d3:	48 89 c7             	mov    %rax,%rdi
    26d6:	e8 01 06 00 00       	callq  2cdc <_ZNSt6vectorIiSaIiEEixEm>
    26db:	8b 00                	mov    (%rax),%eax
    26dd:	83 f8 ff             	cmp    $0xffffffff,%eax
    26e0:	0f 94 c0             	sete   %al
    26e3:	84 c0                	test   %al,%al
    26e5:	74 4a                	je     2731 <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE+0x1b5>
    26e7:	8b 45 8c             	mov    -0x74(%rbp),%eax
    26ea:	48 63 d0             	movslq %eax,%rdx
    26ed:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    26f4:	48 89 d6             	mov    %rdx,%rsi
    26f7:	48 89 c7             	mov    %rax,%rdi
    26fa:	e8 dd 05 00 00       	callq  2cdc <_ZNSt6vectorIiSaIiEEixEm>
    26ff:	8b 18                	mov    (%rax),%ebx
    2701:	8b 45 88             	mov    -0x78(%rbp),%eax
    2704:	48 63 d0             	movslq %eax,%rdx
    2707:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    270e:	48 89 d6             	mov    %rdx,%rsi
    2711:	48 89 c7             	mov    %rax,%rdi
    2714:	e8 c3 05 00 00       	callq  2cdc <_ZNSt6vectorIiSaIiEEixEm>
    2719:	8d 53 01             	lea    0x1(%rbx),%edx
    271c:	89 10                	mov    %edx,(%rax)
    271e:	48 8d 55 88          	lea    -0x78(%rbp),%rdx
    2722:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    2726:	48 89 d6             	mov    %rdx,%rsi
    2729:	48 89 c7             	mov    %rax,%rdi
    272c:	e8 a3 08 00 00       	callq  2fd4 <_ZNSt6vectorIiSaIiEE9push_backERKi>
    2731:	48 83 45 98 04       	addq   $0x4,-0x68(%rbp)
    2736:	e9 71 ff ff ff       	jmpq   26ac <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE+0x130>
    273b:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    273f:	be 00 00 00 00       	mov    $0x0,%esi
    2744:	48 89 c7             	mov    %rax,%rdi
    2747:	e8 e4 09 00 00       	callq  3130 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEppEi>
    274c:	e9 d2 fe ff ff       	jmpq   2623 <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE+0xa7>
    2751:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    2755:	48 89 c7             	mov    %rax,%rdi
    2758:	e8 41 06 00 00       	callq  2d9e <_ZNSt6vectorIiSaIiEED1Ev>
    275d:	90                   	nop
    275e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2762:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    2769:	00 00 
    276b:	74 2e                	je     279b <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE+0x21f>
    276d:	eb 27                	jmp    2796 <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE+0x21a>
    276f:	f3 0f 1e fa          	endbr64 
    2773:	48 89 c3             	mov    %rax,%rbx
    2776:	eb 07                	jmp    277f <_Z9BFSKernelR8CSRGraphIiiLb1EEiRSt6vectorIiSaIiEE+0x203>
    2778:	f3 0f 1e fa          	endbr64 
    277c:	48 89 c3             	mov    %rax,%rbx
    277f:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    2783:	48 89 c7             	mov    %rax,%rdi
    2786:	e8 13 06 00 00       	callq  2d9e <_ZNSt6vectorIiSaIiEED1Ev>
    278b:	48 89 d8             	mov    %rbx,%rax
    278e:	48 89 c7             	mov    %rax,%rdi
    2791:	e8 9a fc ff ff       	callq  2430 <_Unwind_Resume@plt>
    2796:	e8 d5 fb ff ff       	callq  2370 <__stack_chk_fail@plt>
    279b:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    27a2:	5b                   	pop    %rbx
    27a3:	5d                   	pop    %rbp
    27a4:	c3                   	retq   

00000000000027a5 <_Z10PullKernelR8CSRGraphIiiLb1EERSt6vectorIiSaIiEES5_>:
    27a5:	f3 0f 1e fa          	endbr64 
    27a9:	55                   	push   %rbp
    27aa:	48 89 e5             	mov    %rsp,%rbp
    27ad:	41 54                	push   %r12
    27af:	53                   	push   %rbx
    27b0:	48 83 ec 60          	sub    $0x60,%rsp
    27b4:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
    27b8:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
    27bc:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    27c0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    27c7:	00 00 
    27c9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    27cd:	31 c0                	xor    %eax,%eax
    27cf:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%rbp)
    27d6:	8b 45 b0             	mov    -0x50(%rbp),%eax
    27d9:	48 63 d8             	movslq %eax,%rbx
    27dc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    27e0:	48 89 c7             	mov    %rax,%rdi
    27e3:	e8 fe 05 00 00       	callq  2de6 <_ZNK8CSRGraphIiiLb1EE9num_nodesEv>
    27e8:	48 39 c3             	cmp    %rax,%rbx
    27eb:	0f 9c c0             	setl   %al
    27ee:	84 c0                	test   %al,%al
    27f0:	0f 84 13 01 00 00    	je     2909 <_Z10PullKernelR8CSRGraphIiiLb1EERSt6vectorIiSaIiEES5_+0x164>
    27f6:	8b 45 b0             	mov    -0x50(%rbp),%eax
    27f9:	89 c7                	mov    %eax,%edi
    27fb:	e8 49 fd ff ff       	callq  2549 <_Z17PIN_updateCurrDstj>
    2800:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    2804:	8b 55 b0             	mov    -0x50(%rbp),%edx
    2807:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
    280b:	b9 00 00 00 00       	mov    $0x0,%ecx
    2810:	48 89 c7             	mov    %rax,%rdi
    2813:	e8 34 0a 00 00       	callq  324c <_ZNK8CSRGraphIiiLb1EE8in_neighEim>
    2818:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    281c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2820:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2824:	48 89 c7             	mov    %rax,%rdi
    2827:	e8 bc 09 00 00       	callq  31e8 <_ZN8CSRGraphIiiLb1EE12Neighborhood5beginEv>
    282c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    2830:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2834:	48 89 c7             	mov    %rax,%rdi
    2837:	e8 e4 09 00 00       	callq  3220 <_ZN8CSRGraphIiiLb1EE12Neighborhood3endEv>
    283c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2840:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    2844:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
    2848:	0f 84 b2 00 00 00    	je     2900 <_Z10PullKernelR8CSRGraphIiiLb1EERSt6vectorIiSaIiEES5_+0x15b>
    284e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    2852:	8b 00                	mov    (%rax),%eax
    2854:	89 45 b4             	mov    %eax,-0x4c(%rbp)
    2857:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    285a:	48 63 d0             	movslq %eax,%rdx
    285d:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    2861:	48 89 d6             	mov    %rdx,%rsi
    2864:	48 89 c7             	mov    %rax,%rdi
    2867:	e8 70 04 00 00       	callq  2cdc <_ZNSt6vectorIiSaIiEEixEm>
    286c:	8b 18                	mov    (%rax),%ebx
    286e:	8b 45 b0             	mov    -0x50(%rbp),%eax
    2871:	48 63 d0             	movslq %eax,%rdx
    2874:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    2878:	48 89 d6             	mov    %rdx,%rsi
    287b:	48 89 c7             	mov    %rax,%rdi
    287e:	e8 59 04 00 00       	callq  2cdc <_ZNSt6vectorIiSaIiEEixEm>
    2883:	8b 10                	mov    (%rax),%edx
    2885:	01 da                	add    %ebx,%edx
    2887:	89 10                	mov    %edx,(%rax)
    2889:	48 8d 35 79 27 00 00 	lea    0x2779(%rip),%rsi        # 5009 <_ZStL19piecewise_construct+0x1>
    2890:	48 8d 3d a9 57 00 00 	lea    0x57a9(%rip),%rdi        # 8040 <_ZSt4cout@@GLIBCXX_3.4>
    2897:	e8 84 fa ff ff       	callq  2320 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    289c:	48 89 c3             	mov    %rax,%rbx
    289f:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    28a2:	48 63 d0             	movslq %eax,%rdx
    28a5:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    28a9:	48 89 d6             	mov    %rdx,%rsi
    28ac:	48 89 c7             	mov    %rax,%rdi
    28af:	e8 28 04 00 00       	callq  2cdc <_ZNSt6vectorIiSaIiEEixEm>
    28b4:	49 89 c4             	mov    %rax,%r12
    28b7:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    28bb:	48 89 c7             	mov    %rax,%rdi
    28be:	e8 c5 09 00 00       	callq  3288 <_ZNSt6vectorIiSaIiEE5frontEv>
    28c3:	4c 89 e2             	mov    %r12,%rdx
    28c6:	48 29 c2             	sub    %rax,%rdx
    28c9:	48 b8 90 30 7c 42 42 	movabs $0x5642427c3090,%rax
    28d0:	56 00 00 
    28d3:	48 01 d0             	add    %rdx,%rax
    28d6:	48 89 c6             	mov    %rax,%rsi
    28d9:	48 89 df             	mov    %rbx,%rdi
    28dc:	e8 8f f9 ff ff       	callq  2270 <_ZNSolsEm@plt>
    28e1:	48 89 c2             	mov    %rax,%rdx
    28e4:	48 8b 05 e5 56 00 00 	mov    0x56e5(%rip),%rax        # 7fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    28eb:	48 89 c6             	mov    %rax,%rsi
    28ee:	48 89 d7             	mov    %rdx,%rdi
    28f1:	e8 5a fa ff ff       	callq  2350 <_ZNSolsEPFRSoS_E@plt>
    28f6:	48 83 45 b8 04       	addq   $0x4,-0x48(%rbp)
    28fb:	e9 40 ff ff ff       	jmpq   2840 <_Z10PullKernelR8CSRGraphIiiLb1EERSt6vectorIiSaIiEES5_+0x9b>
    2900:	83 45 b0 01          	addl   $0x1,-0x50(%rbp)
    2904:	e9 cd fe ff ff       	jmpq   27d6 <_Z10PullKernelR8CSRGraphIiiLb1EERSt6vectorIiSaIiEES5_+0x31>
    2909:	90                   	nop
    290a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    290e:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    2915:	00 00 
    2917:	74 05                	je     291e <_Z10PullKernelR8CSRGraphIiiLb1EERSt6vectorIiSaIiEES5_+0x179>
    2919:	e8 52 fa ff ff       	callq  2370 <__stack_chk_fail@plt>
    291e:	48 83 c4 60          	add    $0x60,%rsp
    2922:	5b                   	pop    %rbx
    2923:	41 5c                	pop    %r12
    2925:	5d                   	pop    %rbp
    2926:	c3                   	retq   

0000000000002927 <main>:
    2927:	f3 0f 1e fa          	endbr64 
    292b:	55                   	push   %rbp
    292c:	48 89 e5             	mov    %rsp,%rbp
    292f:	53                   	push   %rbx
    2930:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
    2937:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    293e:	00 00 
    2940:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    2944:	31 c0                	xor    %eax,%eax
    2946:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    294d:	48 89 c7             	mov    %rax,%rdi
    2950:	e8 eb fa ff ff       	callq  2440 <_ZNSaIcEC1Ev@plt>
    2955:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
    295c:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    2960:	48 8d 35 a9 26 00 00 	lea    0x26a9(%rip),%rsi        # 5010 <_ZStL19piecewise_construct+0x8>
    2967:	48 89 c7             	mov    %rax,%rdi
    296a:	e8 41 fa ff ff       	callq  23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_@plt>
    296f:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
    2973:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    2977:	48 89 d6             	mov    %rdx,%rsi
    297a:	48 89 c7             	mov    %rax,%rdi
    297d:	e8 58 09 00 00       	callq  32da <_ZN6ReaderIiiiLb1EEC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    2982:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    2986:	48 89 c7             	mov    %rax,%rdi
    2989:	e8 52 f9 ff ff       	callq  22e0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    298e:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    2995:	48 89 c7             	mov    %rax,%rdi
    2998:	e8 c3 f9 ff ff       	callq  2360 <_ZNSaIcED1Ev@plt>
    299d:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    29a4:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
    29a8:	48 89 d6             	mov    %rdx,%rsi
    29ab:	48 89 c7             	mov    %rax,%rdi
    29ae:	e8 51 09 00 00       	callq  3304 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv>
    29b3:	be 01 00 00 00       	mov    $0x1,%esi
    29b8:	48 8d 3d 51 26 00 00 	lea    0x2651(%rip),%rdi        # 5010 <_ZStL19piecewise_construct+0x8>
    29bf:	e8 a6 fb ff ff       	callq  256a <_Z18PIN_registerGraphsPcj>
    29c4:	48 8d 85 1c ff ff ff 	lea    -0xe4(%rbp),%rax
    29cb:	48 89 c7             	mov    %rax,%rdi
    29ce:	e8 81 0d 00 00       	callq  3754 <_ZNSaIiEC1Ev>
    29d3:	c7 85 40 ff ff ff 01 	movl   $0x1,-0xc0(%rbp)
    29da:	00 00 00 
    29dd:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    29e4:	48 89 c7             	mov    %rax,%rdi
    29e7:	e8 fa 03 00 00       	callq  2de6 <_ZNK8CSRGraphIiiLb1EE9num_nodesEv>
    29ec:	48 89 c6             	mov    %rax,%rsi
    29ef:	48 8d 8d 1c ff ff ff 	lea    -0xe4(%rbp),%rcx
    29f6:	48 8d 95 40 ff ff ff 	lea    -0xc0(%rbp),%rdx
    29fd:	48 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%rax
    2a04:	48 89 c7             	mov    %rax,%rdi
    2a07:	e8 68 0d 00 00       	callq  3774 <_ZNSt6vectorIiSaIiEEC1EmRKiRKS0_>
    2a0c:	48 8d 85 1c ff ff ff 	lea    -0xe4(%rbp),%rax
    2a13:	48 89 c7             	mov    %rax,%rdi
    2a16:	e8 11 03 00 00       	callq  2d2c <_ZNSaIiED1Ev>
    2a1b:	48 8d 85 1b ff ff ff 	lea    -0xe5(%rbp),%rax
    2a22:	48 89 c7             	mov    %rax,%rdi
    2a25:	e8 2a 0d 00 00       	callq  3754 <_ZNSaIiEC1Ev>
    2a2a:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%rbp)
    2a31:	00 00 00 
    2a34:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    2a3b:	48 89 c7             	mov    %rax,%rdi
    2a3e:	e8 a3 03 00 00       	callq  2de6 <_ZNK8CSRGraphIiiLb1EE9num_nodesEv>
    2a43:	48 89 c6             	mov    %rax,%rsi
    2a46:	48 8d 8d 1b ff ff ff 	lea    -0xe5(%rbp),%rcx
    2a4d:	48 8d 95 1c ff ff ff 	lea    -0xe4(%rbp),%rdx
    2a54:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
    2a5b:	48 89 c7             	mov    %rax,%rdi
    2a5e:	e8 11 0d 00 00       	callq  3774 <_ZNSt6vectorIiSaIiEEC1EmRKiRKS0_>
    2a63:	48 8d 85 1b ff ff ff 	lea    -0xe5(%rbp),%rax
    2a6a:	48 89 c7             	mov    %rax,%rdi
    2a6d:	e8 ba 02 00 00       	callq  2d2c <_ZNSaIiED1Ev>
    2a72:	48 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%rax
    2a79:	48 89 c7             	mov    %rax,%rdi
    2a7c:	e8 7b 0d 00 00       	callq  37fc <_ZNSt6vectorIiSaIiEE4backEv>
    2a81:	48 8d 58 04          	lea    0x4(%rax),%rbx
    2a85:	48 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%rax
    2a8c:	48 89 c7             	mov    %rax,%rdi
    2a8f:	e8 f4 07 00 00       	callq  3288 <_ZNSt6vectorIiSaIiEE5frontEv>
    2a94:	48 89 de             	mov    %rbx,%rsi
    2a97:	48 89 c7             	mov    %rax,%rdi
    2a9a:	e8 b8 fa ff ff       	callq  2557 <_Z22PIN_updateRegBaseBoundmm>
    2a9f:	48 8d 95 40 ff ff ff 	lea    -0xc0(%rbp),%rdx
    2aa6:	48 8d 8d 20 ff ff ff 	lea    -0xe0(%rbp),%rcx
    2aad:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    2ab4:	48 89 ce             	mov    %rcx,%rsi
    2ab7:	48 89 c7             	mov    %rax,%rdi
    2aba:	e8 e6 fc ff ff       	callq  27a5 <_Z10PullKernelR8CSRGraphIiiLb1EERSt6vectorIiSaIiEES5_>
    2abf:	bb 00 00 00 00       	mov    $0x0,%ebx
    2ac4:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
    2acb:	48 89 c7             	mov    %rax,%rdi
    2ace:	e8 cb 02 00 00       	callq  2d9e <_ZNSt6vectorIiSaIiEED1Ev>
    2ad3:	48 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%rax
    2ada:	48 89 c7             	mov    %rax,%rdi
    2add:	e8 bc 02 00 00       	callq  2d9e <_ZNSt6vectorIiSaIiEED1Ev>
    2ae2:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    2ae9:	48 89 c7             	mov    %rax,%rdi
    2aec:	e8 43 0c 00 00       	callq  3734 <_ZN8CSRGraphIiiLb1EED1Ev>
    2af1:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    2af5:	48 89 c7             	mov    %rax,%rdi
    2af8:	e8 bf 01 00 00       	callq  2cbc <_ZN6ReaderIiiiLb1EED1Ev>
    2afd:	89 d8                	mov    %ebx,%eax
    2aff:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2b03:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2b0a:	00 00 
    2b0c:	0f 84 c4 00 00 00    	je     2bd6 <main+0x2af>
    2b12:	e9 ba 00 00 00       	jmpq   2bd1 <main+0x2aa>
    2b17:	f3 0f 1e fa          	endbr64 
    2b1b:	48 89 c3             	mov    %rax,%rbx
    2b1e:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    2b22:	48 89 c7             	mov    %rax,%rdi
    2b25:	e8 b6 f7 ff ff       	callq  22e0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2b2a:	eb 07                	jmp    2b33 <main+0x20c>
    2b2c:	f3 0f 1e fa          	endbr64 
    2b30:	48 89 c3             	mov    %rax,%rbx
    2b33:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    2b3a:	48 89 c7             	mov    %rax,%rdi
    2b3d:	e8 1e f8 ff ff       	callq  2360 <_ZNSaIcED1Ev@plt>
    2b42:	48 89 d8             	mov    %rbx,%rax
    2b45:	48 89 c7             	mov    %rax,%rdi
    2b48:	e8 e3 f8 ff ff       	callq  2430 <_Unwind_Resume@plt>
    2b4d:	f3 0f 1e fa          	endbr64 
    2b51:	48 89 c3             	mov    %rax,%rbx
    2b54:	48 8d 85 1c ff ff ff 	lea    -0xe4(%rbp),%rax
    2b5b:	48 89 c7             	mov    %rax,%rdi
    2b5e:	e8 c9 01 00 00       	callq  2d2c <_ZNSaIiED1Ev>
    2b63:	eb 3d                	jmp    2ba2 <main+0x27b>
    2b65:	f3 0f 1e fa          	endbr64 
    2b69:	48 89 c3             	mov    %rax,%rbx
    2b6c:	48 8d 85 1b ff ff ff 	lea    -0xe5(%rbp),%rax
    2b73:	48 89 c7             	mov    %rax,%rdi
    2b76:	e8 b1 01 00 00       	callq  2d2c <_ZNSaIiED1Ev>
    2b7b:	eb 16                	jmp    2b93 <main+0x26c>
    2b7d:	f3 0f 1e fa          	endbr64 
    2b81:	48 89 c3             	mov    %rax,%rbx
    2b84:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
    2b8b:	48 89 c7             	mov    %rax,%rdi
    2b8e:	e8 0b 02 00 00       	callq  2d9e <_ZNSt6vectorIiSaIiEED1Ev>
    2b93:	48 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%rax
    2b9a:	48 89 c7             	mov    %rax,%rdi
    2b9d:	e8 fc 01 00 00       	callq  2d9e <_ZNSt6vectorIiSaIiEED1Ev>
    2ba2:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    2ba9:	48 89 c7             	mov    %rax,%rdi
    2bac:	e8 83 0b 00 00       	callq  3734 <_ZN8CSRGraphIiiLb1EED1Ev>
    2bb1:	eb 07                	jmp    2bba <main+0x293>
    2bb3:	f3 0f 1e fa          	endbr64 
    2bb7:	48 89 c3             	mov    %rax,%rbx
    2bba:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    2bbe:	48 89 c7             	mov    %rax,%rdi
    2bc1:	e8 f6 00 00 00       	callq  2cbc <_ZN6ReaderIiiiLb1EED1Ev>
    2bc6:	48 89 d8             	mov    %rbx,%rax
    2bc9:	48 89 c7             	mov    %rax,%rdi
    2bcc:	e8 5f f8 ff ff       	callq  2430 <_Unwind_Resume@plt>
    2bd1:	e8 9a f7 ff ff       	callq  2370 <__stack_chk_fail@plt>
    2bd6:	48 81 c4 e8 00 00 00 	add    $0xe8,%rsp
    2bdd:	5b                   	pop    %rbx
    2bde:	5d                   	pop    %rbp
    2bdf:	c3                   	retq   

0000000000002be0 <_Z41__static_initialization_and_destruction_0ii>:
    2be0:	f3 0f 1e fa          	endbr64 
    2be4:	55                   	push   %rbp
    2be5:	48 89 e5             	mov    %rsp,%rbp
    2be8:	48 83 ec 10          	sub    $0x10,%rsp
    2bec:	89 7d fc             	mov    %edi,-0x4(%rbp)
    2bef:	89 75 f8             	mov    %esi,-0x8(%rbp)
    2bf2:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    2bf6:	75 32                	jne    2c2a <_Z41__static_initialization_and_destruction_0ii+0x4a>
    2bf8:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
    2bff:	75 29                	jne    2c2a <_Z41__static_initialization_and_destruction_0ii+0x4a>
    2c01:	48 8d 3d 49 55 00 00 	lea    0x5549(%rip),%rdi        # 8151 <_ZStL8__ioinit>
    2c08:	e8 d3 f7 ff ff       	callq  23e0 <_ZNSt8ios_base4InitC1Ev@plt>
    2c0d:	48 8d 15 f4 53 00 00 	lea    0x53f4(%rip),%rdx        # 8008 <__dso_handle>
    2c14:	48 8d 35 36 55 00 00 	lea    0x5536(%rip),%rsi        # 8151 <_ZStL8__ioinit>
    2c1b:	48 8b 05 d6 53 00 00 	mov    0x53d6(%rip),%rax        # 7ff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    2c22:	48 89 c7             	mov    %rax,%rdi
    2c25:	e8 c6 f6 ff ff       	callq  22f0 <__cxa_atexit@plt>
    2c2a:	90                   	nop
    2c2b:	c9                   	leaveq 
    2c2c:	c3                   	retq   

0000000000002c2d <_GLOBAL__sub_I__Z17PIN_updateCurrDstj>:
    2c2d:	f3 0f 1e fa          	endbr64 
    2c31:	55                   	push   %rbp
    2c32:	48 89 e5             	mov    %rsp,%rbp
    2c35:	be ff ff 00 00       	mov    $0xffff,%esi
    2c3a:	bf 01 00 00 00       	mov    $0x1,%edi
    2c3f:	e8 9c ff ff ff       	callq  2be0 <_Z41__static_initialization_and_destruction_0ii>
    2c44:	5d                   	pop    %rbp
    2c45:	c3                   	retq   

0000000000002c46 <_ZnwmPv>:
    2c46:	f3 0f 1e fa          	endbr64 
    2c4a:	55                   	push   %rbp
    2c4b:	48 89 e5             	mov    %rsp,%rbp
    2c4e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2c52:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2c56:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c5a:	5d                   	pop    %rbp
    2c5b:	c3                   	retq   

0000000000002c5c <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev>:
    2c5c:	f3 0f 1e fa          	endbr64 
    2c60:	55                   	push   %rbp
    2c61:	48 89 e5             	mov    %rsp,%rbp
    2c64:	48 83 ec 10          	sub    $0x10,%rsp
    2c68:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2c6c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2c70:	48 89 c7             	mov    %rax,%rdi
    2c73:	e8 b4 00 00 00       	callq  2d2c <_ZNSaIiED1Ev>
    2c78:	90                   	nop
    2c79:	c9                   	leaveq 
    2c7a:	c3                   	retq   
    2c7b:	90                   	nop

0000000000002c7c <_ZNSt12_Vector_baseIiSaIiEEC1Ev>:
    2c7c:	f3 0f 1e fa          	endbr64 
    2c80:	55                   	push   %rbp
    2c81:	48 89 e5             	mov    %rsp,%rbp
    2c84:	48 83 ec 10          	sub    $0x10,%rsp
    2c88:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2c8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2c90:	48 89 c7             	mov    %rax,%rdi
    2c93:	e8 68 00 00 00       	callq  2d00 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev>
    2c98:	90                   	nop
    2c99:	c9                   	leaveq 
    2c9a:	c3                   	retq   
    2c9b:	90                   	nop

0000000000002c9c <_ZNSt6vectorIiSaIiEEC1Ev>:
    2c9c:	f3 0f 1e fa          	endbr64 
    2ca0:	55                   	push   %rbp
    2ca1:	48 89 e5             	mov    %rsp,%rbp
    2ca4:	48 83 ec 10          	sub    $0x10,%rsp
    2ca8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2cac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2cb0:	48 89 c7             	mov    %rax,%rdi
    2cb3:	e8 c4 ff ff ff       	callq  2c7c <_ZNSt12_Vector_baseIiSaIiEEC1Ev>
    2cb8:	90                   	nop
    2cb9:	c9                   	leaveq 
    2cba:	c3                   	retq   
    2cbb:	90                   	nop

0000000000002cbc <_ZN6ReaderIiiiLb1EED1Ev>:
    2cbc:	f3 0f 1e fa          	endbr64 
    2cc0:	55                   	push   %rbp
    2cc1:	48 89 e5             	mov    %rsp,%rbp
    2cc4:	48 83 ec 10          	sub    $0x10,%rsp
    2cc8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2ccc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2cd0:	48 89 c7             	mov    %rax,%rdi
    2cd3:	e8 08 f6 ff ff       	callq  22e0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2cd8:	90                   	nop
    2cd9:	c9                   	leaveq 
    2cda:	c3                   	retq   
    2cdb:	90                   	nop

0000000000002cdc <_ZNSt6vectorIiSaIiEEixEm>:
    2cdc:	f3 0f 1e fa          	endbr64 
    2ce0:	55                   	push   %rbp
    2ce1:	48 89 e5             	mov    %rsp,%rbp
    2ce4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2ce8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2cec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2cf0:	48 8b 00             	mov    (%rax),%rax
    2cf3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2cf7:	48 c1 e2 02          	shl    $0x2,%rdx
    2cfb:	48 01 d0             	add    %rdx,%rax
    2cfe:	5d                   	pop    %rbp
    2cff:	c3                   	retq   

0000000000002d00 <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev>:
    2d00:	f3 0f 1e fa          	endbr64 
    2d04:	55                   	push   %rbp
    2d05:	48 89 e5             	mov    %rsp,%rbp
    2d08:	48 83 ec 10          	sub    $0x10,%rsp
    2d0c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2d10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2d14:	48 89 c7             	mov    %rax,%rdi
    2d17:	e8 38 0a 00 00       	callq  3754 <_ZNSaIiEC1Ev>
    2d1c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2d20:	48 89 c7             	mov    %rax,%rdi
    2d23:	e8 3a 0b 00 00       	callq  3862 <_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC1Ev>
    2d28:	90                   	nop
    2d29:	c9                   	leaveq 
    2d2a:	c3                   	retq   
    2d2b:	90                   	nop

0000000000002d2c <_ZNSaIiED1Ev>:
    2d2c:	f3 0f 1e fa          	endbr64 
    2d30:	55                   	push   %rbp
    2d31:	48 89 e5             	mov    %rsp,%rbp
    2d34:	48 83 ec 10          	sub    $0x10,%rsp
    2d38:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2d3c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2d40:	48 89 c7             	mov    %rax,%rdi
    2d43:	e8 4c 0b 00 00       	callq  3894 <_ZN9__gnu_cxx13new_allocatorIiED1Ev>
    2d48:	90                   	nop
    2d49:	c9                   	leaveq 
    2d4a:	c3                   	retq   
    2d4b:	90                   	nop

0000000000002d4c <_ZNSt12_Vector_baseIiSaIiEED1Ev>:
    2d4c:	f3 0f 1e fa          	endbr64 
    2d50:	55                   	push   %rbp
    2d51:	48 89 e5             	mov    %rsp,%rbp
    2d54:	48 83 ec 10          	sub    $0x10,%rsp
    2d58:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2d5c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2d60:	48 8b 50 10          	mov    0x10(%rax),%rdx
    2d64:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2d68:	48 8b 00             	mov    (%rax),%rax
    2d6b:	48 29 c2             	sub    %rax,%rdx
    2d6e:	48 89 d0             	mov    %rdx,%rax
    2d71:	48 c1 f8 02          	sar    $0x2,%rax
    2d75:	48 89 c2             	mov    %rax,%rdx
    2d78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2d7c:	48 8b 08             	mov    (%rax),%rcx
    2d7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2d83:	48 89 ce             	mov    %rcx,%rsi
    2d86:	48 89 c7             	mov    %rax,%rdi
    2d89:	e8 16 0b 00 00       	callq  38a4 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim>
    2d8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2d92:	48 89 c7             	mov    %rax,%rdi
    2d95:	e8 c2 fe ff ff       	callq  2c5c <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev>
    2d9a:	90                   	nop
    2d9b:	c9                   	leaveq 
    2d9c:	c3                   	retq   
    2d9d:	90                   	nop

0000000000002d9e <_ZNSt6vectorIiSaIiEED1Ev>:
    2d9e:	f3 0f 1e fa          	endbr64 
    2da2:	55                   	push   %rbp
    2da3:	48 89 e5             	mov    %rsp,%rbp
    2da6:	48 83 ec 10          	sub    $0x10,%rsp
    2daa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2dae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2db2:	48 89 c7             	mov    %rax,%rdi
    2db5:	e8 24 0b 00 00       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    2dba:	48 89 c2             	mov    %rax,%rdx
    2dbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2dc1:	48 8b 48 08          	mov    0x8(%rax),%rcx
    2dc5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2dc9:	48 8b 00             	mov    (%rax),%rax
    2dcc:	48 89 ce             	mov    %rcx,%rsi
    2dcf:	48 89 c7             	mov    %rax,%rdi
    2dd2:	e8 19 0b 00 00       	callq  38f0 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E>
    2dd7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2ddb:	48 89 c7             	mov    %rax,%rdi
    2dde:	e8 69 ff ff ff       	callq  2d4c <_ZNSt12_Vector_baseIiSaIiEED1Ev>
    2de3:	90                   	nop
    2de4:	c9                   	leaveq 
    2de5:	c3                   	retq   

0000000000002de6 <_ZNK8CSRGraphIiiLb1EE9num_nodesEv>:
    2de6:	f3 0f 1e fa          	endbr64 
    2dea:	55                   	push   %rbp
    2deb:	48 89 e5             	mov    %rsp,%rbp
    2dee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2df2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2df6:	48 8b 40 08          	mov    0x8(%rax),%rax
    2dfa:	5d                   	pop    %rbp
    2dfb:	c3                   	retq   

0000000000002dfc <_ZNSt6vectorIiSaIiEE15_S_use_relocateEv>:
    2dfc:	f3 0f 1e fa          	endbr64 
    2e00:	55                   	push   %rbp
    2e01:	48 89 e5             	mov    %rsp,%rbp
    2e04:	48 83 ec 10          	sub    $0x10,%rsp
    2e08:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2e0f:	00 00 
    2e11:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    2e15:	31 c0                	xor    %eax,%eax
    2e17:	e8 16 00 00 00       	callq  2e32 <_ZNSt6vectorIiSaIiEE19_S_nothrow_relocateESt17integral_constantIbLb1EE>
    2e1c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2e20:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    2e27:	00 00 
    2e29:	74 05                	je     2e30 <_ZNSt6vectorIiSaIiEE15_S_use_relocateEv+0x34>
    2e2b:	e8 40 f5 ff ff       	callq  2370 <__stack_chk_fail@plt>
    2e30:	c9                   	leaveq 
    2e31:	c3                   	retq   

0000000000002e32 <_ZNSt6vectorIiSaIiEE19_S_nothrow_relocateESt17integral_constantIbLb1EE>:
    2e32:	f3 0f 1e fa          	endbr64 
    2e36:	55                   	push   %rbp
    2e37:	48 89 e5             	mov    %rsp,%rbp
    2e3a:	b8 01 00 00 00       	mov    $0x1,%eax
    2e3f:	5d                   	pop    %rbp
    2e40:	c3                   	retq   
    2e41:	90                   	nop

0000000000002e42 <_ZNSt6vectorIiSaIiEE7reserveEm>:
    2e42:	f3 0f 1e fa          	endbr64 
    2e46:	55                   	push   %rbp
    2e47:	48 89 e5             	mov    %rsp,%rbp
    2e4a:	53                   	push   %rbx
    2e4b:	48 83 ec 28          	sub    $0x28,%rsp
    2e4f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    2e53:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    2e57:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2e5b:	48 89 c7             	mov    %rax,%rdi
    2e5e:	e8 bb 0a 00 00       	callq  391e <_ZNKSt6vectorIiSaIiEE8max_sizeEv>
    2e63:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
    2e67:	0f 97 c0             	seta   %al
    2e6a:	84 c0                	test   %al,%al
    2e6c:	74 0c                	je     2e7a <_ZNSt6vectorIiSaIiEE7reserveEm+0x38>
    2e6e:	48 8d 3d aa 21 00 00 	lea    0x21aa(%rip),%rdi        # 501f <_ZStL19piecewise_construct+0x17>
    2e75:	e8 56 f4 ff ff       	callq  22d0 <_ZSt20__throw_length_errorPKc@plt>
    2e7a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2e7e:	48 89 c7             	mov    %rax,%rdi
    2e81:	e8 be 0a 00 00       	callq  3944 <_ZNKSt6vectorIiSaIiEE8capacityEv>
    2e86:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
    2e8a:	0f 97 c0             	seta   %al
    2e8d:	84 c0                	test   %al,%al
    2e8f:	0f 84 36 01 00 00    	je     2fcb <_ZNSt6vectorIiSaIiEE7reserveEm+0x189>
    2e95:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2e99:	48 89 c7             	mov    %rax,%rdi
    2e9c:	e8 cb 0a 00 00       	callq  396c <_ZNKSt6vectorIiSaIiEE4sizeEv>
    2ea1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    2ea5:	e8 52 ff ff ff       	callq  2dfc <_ZNSt6vectorIiSaIiEE15_S_use_relocateEv>
    2eaa:	84 c0                	test   %al,%al
    2eac:	74 43                	je     2ef1 <_ZNSt6vectorIiSaIiEE7reserveEm+0xaf>
    2eae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2eb2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    2eb6:	48 89 d6             	mov    %rdx,%rsi
    2eb9:	48 89 c7             	mov    %rax,%rdi
    2ebc:	e8 d3 0a 00 00       	callq  3994 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm>
    2ec1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    2ec5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2ec9:	48 89 c7             	mov    %rax,%rdi
    2ecc:	e8 0d 0a 00 00       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    2ed1:	48 89 c1             	mov    %rax,%rcx
    2ed4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2ed8:	48 8b 70 08          	mov    0x8(%rax),%rsi
    2edc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2ee0:	48 8b 00             	mov    (%rax),%rax
    2ee3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    2ee7:	48 89 c7             	mov    %rax,%rdi
    2eea:	e8 dc 0a 00 00       	callq  39cb <_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_>
    2eef:	eb 65                	jmp    2f56 <_ZNSt6vectorIiSaIiEE7reserveEm+0x114>
    2ef1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2ef5:	48 8b 40 08          	mov    0x8(%rax),%rax
    2ef9:	48 89 c7             	mov    %rax,%rdi
    2efc:	e8 23 0b 00 00       	callq  3a24 <_ZSt32__make_move_if_noexcept_iteratorIiSt13move_iteratorIPiEET0_PT_>
    2f01:	48 89 c3             	mov    %rax,%rbx
    2f04:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f08:	48 8b 00             	mov    (%rax),%rax
    2f0b:	48 89 c7             	mov    %rax,%rdi
    2f0e:	e8 11 0b 00 00       	callq  3a24 <_ZSt32__make_move_if_noexcept_iteratorIiSt13move_iteratorIPiEET0_PT_>
    2f13:	48 89 c2             	mov    %rax,%rdx
    2f16:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    2f1a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f1e:	48 89 d9             	mov    %rbx,%rcx
    2f21:	48 89 c7             	mov    %rax,%rdi
    2f24:	e8 47 0b 00 00       	callq  3a70 <_ZNSt6vectorIiSaIiEE20_M_allocate_and_copyISt13move_iteratorIPiEEES4_mT_S6_>
    2f29:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    2f2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f31:	48 89 c7             	mov    %rax,%rdi
    2f34:	e8 a5 09 00 00       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    2f39:	48 89 c2             	mov    %rax,%rdx
    2f3c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f40:	48 8b 48 08          	mov    0x8(%rax),%rcx
    2f44:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f48:	48 8b 00             	mov    (%rax),%rax
    2f4b:	48 89 ce             	mov    %rcx,%rsi
    2f4e:	48 89 c7             	mov    %rax,%rdi
    2f51:	e8 9a 09 00 00       	callq  38f0 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E>
    2f56:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f5a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    2f5e:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
    2f62:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    2f66:	48 8b 12             	mov    (%rdx),%rdx
    2f69:	48 29 d1             	sub    %rdx,%rcx
    2f6c:	48 89 ca             	mov    %rcx,%rdx
    2f6f:	48 c1 fa 02          	sar    $0x2,%rdx
    2f73:	48 89 d6             	mov    %rdx,%rsi
    2f76:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    2f7a:	48 8b 0a             	mov    (%rdx),%rcx
    2f7d:	48 89 f2             	mov    %rsi,%rdx
    2f80:	48 89 ce             	mov    %rcx,%rsi
    2f83:	48 89 c7             	mov    %rax,%rdi
    2f86:	e8 19 09 00 00       	callq  38a4 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim>
    2f8b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f8f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    2f93:	48 89 10             	mov    %rdx,(%rax)
    2f96:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2f9a:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2fa1:	00 
    2fa2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2fa6:	48 01 c2             	add    %rax,%rdx
    2fa9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2fad:	48 89 50 08          	mov    %rdx,0x8(%rax)
    2fb1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2fb5:	48 8b 00             	mov    (%rax),%rax
    2fb8:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    2fbc:	48 c1 e2 02          	shl    $0x2,%rdx
    2fc0:	48 01 c2             	add    %rax,%rdx
    2fc3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2fc7:	48 89 50 10          	mov    %rdx,0x10(%rax)
    2fcb:	90                   	nop
    2fcc:	48 83 c4 28          	add    $0x28,%rsp
    2fd0:	5b                   	pop    %rbx
    2fd1:	5d                   	pop    %rbp
    2fd2:	c3                   	retq   
    2fd3:	90                   	nop

0000000000002fd4 <_ZNSt6vectorIiSaIiEE9push_backERKi>:
    2fd4:	f3 0f 1e fa          	endbr64 
    2fd8:	55                   	push   %rbp
    2fd9:	48 89 e5             	mov    %rsp,%rbp
    2fdc:	48 83 ec 10          	sub    $0x10,%rsp
    2fe0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2fe4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2fe8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2fec:	48 8b 50 08          	mov    0x8(%rax),%rdx
    2ff0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2ff4:	48 8b 40 10          	mov    0x10(%rax),%rax
    2ff8:	48 39 c2             	cmp    %rax,%rdx
    2ffb:	74 31                	je     302e <_ZNSt6vectorIiSaIiEE9push_backERKi+0x5a>
    2ffd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3001:	48 8b 48 08          	mov    0x8(%rax),%rcx
    3005:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3009:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    300d:	48 89 ce             	mov    %rcx,%rsi
    3010:	48 89 c7             	mov    %rax,%rdi
    3013:	e8 fb 0a 00 00       	callq  3b13 <_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_>
    3018:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    301c:	48 8b 40 08          	mov    0x8(%rax),%rax
    3020:	48 8d 50 04          	lea    0x4(%rax),%rdx
    3024:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3028:	48 89 50 08          	mov    %rdx,0x8(%rax)
    302c:	eb 22                	jmp    3050 <_ZNSt6vectorIiSaIiEE9push_backERKi+0x7c>
    302e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3032:	48 89 c7             	mov    %rax,%rdi
    3035:	e8 66 00 00 00       	callq  30a0 <_ZNSt6vectorIiSaIiEE3endEv>
    303a:	48 89 c1             	mov    %rax,%rcx
    303d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    3041:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3045:	48 89 ce             	mov    %rcx,%rsi
    3048:	48 89 c7             	mov    %rax,%rdi
    304b:	e8 00 0b 00 00       	callq  3b50 <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_>
    3050:	90                   	nop
    3051:	c9                   	leaveq 
    3052:	c3                   	retq   
    3053:	90                   	nop

0000000000003054 <_ZNSt6vectorIiSaIiEE5beginEv>:
    3054:	f3 0f 1e fa          	endbr64 
    3058:	55                   	push   %rbp
    3059:	48 89 e5             	mov    %rsp,%rbp
    305c:	48 83 ec 20          	sub    $0x20,%rsp
    3060:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3064:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    306b:	00 00 
    306d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3071:	31 c0                	xor    %eax,%eax
    3073:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    3077:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    307b:	48 89 d6             	mov    %rdx,%rsi
    307e:	48 89 c7             	mov    %rax,%rdi
    3081:	e8 c2 0d 00 00       	callq  3e48 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC1ERKS1_>
    3086:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    308a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    308e:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    3095:	00 00 
    3097:	74 05                	je     309e <_ZNSt6vectorIiSaIiEE5beginEv+0x4a>
    3099:	e8 d2 f2 ff ff       	callq  2370 <__stack_chk_fail@plt>
    309e:	c9                   	leaveq 
    309f:	c3                   	retq   

00000000000030a0 <_ZNSt6vectorIiSaIiEE3endEv>:
    30a0:	f3 0f 1e fa          	endbr64 
    30a4:	55                   	push   %rbp
    30a5:	48 89 e5             	mov    %rsp,%rbp
    30a8:	48 83 ec 20          	sub    $0x20,%rsp
    30ac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    30b0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    30b7:	00 00 
    30b9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    30bd:	31 c0                	xor    %eax,%eax
    30bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    30c3:	48 8d 50 08          	lea    0x8(%rax),%rdx
    30c7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    30cb:	48 89 d6             	mov    %rdx,%rsi
    30ce:	48 89 c7             	mov    %rax,%rdi
    30d1:	e8 72 0d 00 00       	callq  3e48 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC1ERKS1_>
    30d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    30da:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    30de:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    30e5:	00 00 
    30e7:	74 05                	je     30ee <_ZNSt6vectorIiSaIiEE3endEv+0x4e>
    30e9:	e8 82 f2 ff ff       	callq  2370 <__stack_chk_fail@plt>
    30ee:	c9                   	leaveq 
    30ef:	c3                   	retq   

00000000000030f0 <_ZN9__gnu_cxxneIPiSt6vectorIiSaIiEEEEbRKNS_17__normal_iteratorIT_T0_EESA_>:
    30f0:	f3 0f 1e fa          	endbr64 
    30f4:	55                   	push   %rbp
    30f5:	48 89 e5             	mov    %rsp,%rbp
    30f8:	53                   	push   %rbx
    30f9:	48 83 ec 18          	sub    $0x18,%rsp
    30fd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3101:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    3105:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3109:	48 89 c7             	mov    %rax,%rdi
    310c:	e8 59 0d 00 00       	callq  3e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>
    3111:	48 8b 18             	mov    (%rax),%rbx
    3114:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3118:	48 89 c7             	mov    %rax,%rdi
    311b:	e8 4a 0d 00 00       	callq  3e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>
    3120:	48 8b 00             	mov    (%rax),%rax
    3123:	48 39 c3             	cmp    %rax,%rbx
    3126:	0f 95 c0             	setne  %al
    3129:	48 83 c4 18          	add    $0x18,%rsp
    312d:	5b                   	pop    %rbx
    312e:	5d                   	pop    %rbp
    312f:	c3                   	retq   

0000000000003130 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEppEi>:
    3130:	f3 0f 1e fa          	endbr64 
    3134:	55                   	push   %rbp
    3135:	48 89 e5             	mov    %rsp,%rbp
    3138:	48 83 ec 30          	sub    $0x30,%rsp
    313c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    3140:	89 75 d4             	mov    %esi,-0x2c(%rbp)
    3143:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    314a:	00 00 
    314c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3150:	31 c0                	xor    %eax,%eax
    3152:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3156:	48 8b 00             	mov    (%rax),%rax
    3159:	48 8d 48 04          	lea    0x4(%rax),%rcx
    315d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    3161:	48 89 0a             	mov    %rcx,(%rdx)
    3164:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3168:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
    316c:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    3170:	48 89 d6             	mov    %rdx,%rsi
    3173:	48 89 c7             	mov    %rax,%rdi
    3176:	e8 cd 0c 00 00       	callq  3e48 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC1ERKS1_>
    317b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    317f:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    3183:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    318a:	00 00 
    318c:	74 05                	je     3193 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEppEi+0x63>
    318e:	e8 dd f1 ff ff       	callq  2370 <__stack_chk_fail@plt>
    3193:	c9                   	leaveq 
    3194:	c3                   	retq   
    3195:	90                   	nop

0000000000003196 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv>:
    3196:	f3 0f 1e fa          	endbr64 
    319a:	55                   	push   %rbp
    319b:	48 89 e5             	mov    %rsp,%rbp
    319e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    31a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    31a6:	48 8b 00             	mov    (%rax),%rax
    31a9:	5d                   	pop    %rbp
    31aa:	c3                   	retq   
    31ab:	90                   	nop

00000000000031ac <_ZNK8CSRGraphIiiLb1EE9out_neighEim>:
    31ac:	f3 0f 1e fa          	endbr64 
    31b0:	55                   	push   %rbp
    31b1:	48 89 e5             	mov    %rsp,%rbp
    31b4:	48 83 ec 20          	sub    $0x20,%rsp
    31b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    31bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    31c0:	89 55 ec             	mov    %edx,-0x14(%rbp)
    31c3:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    31c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    31cb:	48 8b 50 18          	mov    0x18(%rax),%rdx
    31cf:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    31d3:	8b 75 ec             	mov    -0x14(%rbp),%esi
    31d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    31da:	48 89 c7             	mov    %rax,%rdi
    31dd:	e8 9a 0c 00 00       	callq  3e7c <_ZN8CSRGraphIiiLb1EE12NeighborhoodC1EiPPim>
    31e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    31e6:	c9                   	leaveq 
    31e7:	c3                   	retq   

00000000000031e8 <_ZN8CSRGraphIiiLb1EE12Neighborhood5beginEv>:
    31e8:	f3 0f 1e fa          	endbr64 
    31ec:	55                   	push   %rbp
    31ed:	48 89 e5             	mov    %rsp,%rbp
    31f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    31f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    31f8:	48 8b 50 08          	mov    0x8(%rax),%rdx
    31fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3200:	8b 00                	mov    (%rax),%eax
    3202:	48 98                	cltq   
    3204:	48 c1 e0 03          	shl    $0x3,%rax
    3208:	48 01 d0             	add    %rdx,%rax
    320b:	48 8b 10             	mov    (%rax),%rdx
    320e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3212:	48 8b 40 10          	mov    0x10(%rax),%rax
    3216:	48 c1 e0 02          	shl    $0x2,%rax
    321a:	48 01 d0             	add    %rdx,%rax
    321d:	5d                   	pop    %rbp
    321e:	c3                   	retq   
    321f:	90                   	nop

0000000000003220 <_ZN8CSRGraphIiiLb1EE12Neighborhood3endEv>:
    3220:	f3 0f 1e fa          	endbr64 
    3224:	55                   	push   %rbp
    3225:	48 89 e5             	mov    %rsp,%rbp
    3228:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    322c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3230:	48 8b 50 08          	mov    0x8(%rax),%rdx
    3234:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3238:	8b 00                	mov    (%rax),%eax
    323a:	48 98                	cltq   
    323c:	48 83 c0 01          	add    $0x1,%rax
    3240:	48 c1 e0 03          	shl    $0x3,%rax
    3244:	48 01 d0             	add    %rdx,%rax
    3247:	48 8b 00             	mov    (%rax),%rax
    324a:	5d                   	pop    %rbp
    324b:	c3                   	retq   

000000000000324c <_ZNK8CSRGraphIiiLb1EE8in_neighEim>:
    324c:	f3 0f 1e fa          	endbr64 
    3250:	55                   	push   %rbp
    3251:	48 89 e5             	mov    %rsp,%rbp
    3254:	48 83 ec 20          	sub    $0x20,%rsp
    3258:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    325c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    3260:	89 55 ec             	mov    %edx,-0x14(%rbp)
    3263:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    3267:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    326b:	48 8b 50 28          	mov    0x28(%rax),%rdx
    326f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    3273:	8b 75 ec             	mov    -0x14(%rbp),%esi
    3276:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    327a:	48 89 c7             	mov    %rax,%rdi
    327d:	e8 fa 0b 00 00       	callq  3e7c <_ZN8CSRGraphIiiLb1EE12NeighborhoodC1EiPPim>
    3282:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3286:	c9                   	leaveq 
    3287:	c3                   	retq   

0000000000003288 <_ZNSt6vectorIiSaIiEE5frontEv>:
    3288:	f3 0f 1e fa          	endbr64 
    328c:	55                   	push   %rbp
    328d:	48 89 e5             	mov    %rsp,%rbp
    3290:	48 83 ec 20          	sub    $0x20,%rsp
    3294:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3298:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    329f:	00 00 
    32a1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    32a5:	31 c0                	xor    %eax,%eax
    32a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    32ab:	48 89 c7             	mov    %rax,%rdi
    32ae:	e8 a1 fd ff ff       	callq  3054 <_ZNSt6vectorIiSaIiEE5beginEv>
    32b3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    32b7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    32bb:	48 89 c7             	mov    %rax,%rdi
    32be:	e8 d3 fe ff ff       	callq  3196 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv>
    32c3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    32c7:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    32ce:	00 00 
    32d0:	74 05                	je     32d7 <_ZNSt6vectorIiSaIiEE5frontEv+0x4f>
    32d2:	e8 99 f0 ff ff       	callq  2370 <__stack_chk_fail@plt>
    32d7:	c9                   	leaveq 
    32d8:	c3                   	retq   
    32d9:	90                   	nop

00000000000032da <_ZN6ReaderIiiiLb1EEC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    32da:	f3 0f 1e fa          	endbr64 
    32de:	55                   	push   %rbp
    32df:	48 89 e5             	mov    %rsp,%rbp
    32e2:	48 83 ec 10          	sub    $0x10,%rsp
    32e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    32ea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    32ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    32f2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    32f6:	48 89 d6             	mov    %rdx,%rsi
    32f9:	48 89 c7             	mov    %rax,%rdi
    32fc:	e8 bf ef ff ff       	callq  22c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_@plt>
    3301:	90                   	nop
    3302:	c9                   	leaveq 
    3303:	c3                   	retq   

0000000000003304 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv>:
    3304:	f3 0f 1e fa          	endbr64 
    3308:	55                   	push   %rbp
    3309:	48 89 e5             	mov    %rsp,%rbp
    330c:	53                   	push   %rbx
    330d:	48 81 ec 98 02 00 00 	sub    $0x298,%rsp
    3314:	48 89 bd 68 fd ff ff 	mov    %rdi,-0x298(%rbp)
    331b:	48 89 b5 60 fd ff ff 	mov    %rsi,-0x2a0(%rbp)
    3322:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3329:	00 00 
    332b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    332f:	31 c0                	xor    %eax,%eax
    3331:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    3338:	48 8b 95 60 fd ff ff 	mov    -0x2a0(%rbp),%rdx
    333f:	48 89 d6             	mov    %rdx,%rsi
    3342:	48 89 c7             	mov    %rax,%rdi
    3345:	e8 e2 0b 00 00       	callq  3f2c <_ZN6ReaderIiiiLb1EE9GetSuffixB5cxx11Ev>
    334a:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    3351:	48 8d 35 d7 1c 00 00 	lea    0x1cd7(%rip),%rsi        # 502f <_ZStL19piecewise_construct+0x27>
    3358:	48 89 c7             	mov    %rax,%rdi
    335b:	e8 8b 0c 00 00       	callq  3feb <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_>
    3360:	88 85 7f fd ff ff    	mov    %al,-0x281(%rbp)
    3366:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    336d:	48 89 c7             	mov    %rax,%rdi
    3370:	e8 6b ef ff ff       	callq  22e0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    3375:	80 bd 7f fd ff ff 00 	cmpb   $0x0,-0x281(%rbp)
    337c:	74 32                	je     33b0 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0xac>
    337e:	48 8d 35 b3 1c 00 00 	lea    0x1cb3(%rip),%rsi        # 5038 <_ZStL19piecewise_construct+0x30>
    3385:	48 8d 3d b4 4c 00 00 	lea    0x4cb4(%rip),%rdi        # 8040 <_ZSt4cout@@GLIBCXX_3.4>
    338c:	e8 8f ef ff ff       	callq  2320 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    3391:	48 89 c2             	mov    %rax,%rdx
    3394:	48 8b 05 35 4c 00 00 	mov    0x4c35(%rip),%rax        # 7fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    339b:	48 89 c6             	mov    %rax,%rsi
    339e:	48 89 d7             	mov    %rdx,%rdi
    33a1:	e8 aa ef ff ff       	callq  2350 <_ZNSolsEPFRSoS_E@plt>
    33a6:	bf fb ff ff ff       	mov    $0xfffffffb,%edi
    33ab:	e8 d0 ef ff ff       	callq  2380 <exit@plt>
    33b0:	48 8b 8d 60 fd ff ff 	mov    -0x2a0(%rbp),%rcx
    33b7:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    33be:	ba 08 00 00 00       	mov    $0x8,%edx
    33c3:	48 89 ce             	mov    %rcx,%rsi
    33c6:	48 89 c7             	mov    %rax,%rdi
    33c9:	e8 32 f0 ff ff       	callq  2400 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@plt>
    33ce:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    33d5:	48 89 c7             	mov    %rax,%rdi
    33d8:	e8 13 f0 ff ff       	callq  23f0 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv@plt>
    33dd:	83 f0 01             	xor    $0x1,%eax
    33e0:	84 c0                	test   %al,%al
    33e2:	74 47                	je     342b <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x127>
    33e4:	48 8d 35 73 1c 00 00 	lea    0x1c73(%rip),%rsi        # 505e <_ZStL19piecewise_construct+0x56>
    33eb:	48 8d 3d 4e 4c 00 00 	lea    0x4c4e(%rip),%rdi        # 8040 <_ZSt4cout@@GLIBCXX_3.4>
    33f2:	e8 29 ef ff ff       	callq  2320 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    33f7:	48 89 c2             	mov    %rax,%rdx
    33fa:	48 8b 85 60 fd ff ff 	mov    -0x2a0(%rbp),%rax
    3401:	48 89 c6             	mov    %rax,%rsi
    3404:	48 89 d7             	mov    %rdx,%rdi
    3407:	e8 f4 ee ff ff       	callq  2300 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>
    340c:	48 89 c2             	mov    %rax,%rdx
    340f:	48 8b 05 ba 4b 00 00 	mov    0x4bba(%rip),%rax        # 7fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    3416:	48 89 c6             	mov    %rax,%rsi
    3419:	48 89 d7             	mov    %rdx,%rdi
    341c:	e8 2f ef ff ff       	callq  2350 <_ZNSolsEPFRSoS_E@plt>
    3421:	bf fa ff ff ff       	mov    $0xfffffffa,%edi
    3426:	e8 55 ef ff ff       	callq  2380 <exit@plt>
    342b:	48 c7 85 a0 fd ff ff 	movq   $0x0,-0x260(%rbp)
    3432:	00 00 00 00 
    3436:	48 c7 85 98 fd ff ff 	movq   $0x0,-0x268(%rbp)
    343d:	00 00 00 00 
    3441:	48 c7 85 a8 fd ff ff 	movq   $0x0,-0x258(%rbp)
    3448:	00 00 00 00 
    344c:	48 c7 85 90 fd ff ff 	movq   $0x0,-0x270(%rbp)
    3453:	00 00 00 00 
    3457:	48 8d 8d 7e fd ff ff 	lea    -0x282(%rbp),%rcx
    345e:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    3465:	ba 01 00 00 00       	mov    $0x1,%edx
    346a:	48 89 ce             	mov    %rcx,%rsi
    346d:	48 89 c7             	mov    %rax,%rdi
    3470:	e8 1b ef ff ff       	callq  2390 <_ZNSi4readEPcl@plt>
    3475:	48 8d 8d 88 fd ff ff 	lea    -0x278(%rbp),%rcx
    347c:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    3483:	ba 08 00 00 00       	mov    $0x8,%edx
    3488:	48 89 ce             	mov    %rcx,%rsi
    348b:	48 89 c7             	mov    %rax,%rdi
    348e:	e8 fd ee ff ff       	callq  2390 <_ZNSi4readEPcl@plt>
    3493:	48 8d 8d 80 fd ff ff 	lea    -0x280(%rbp),%rcx
    349a:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    34a1:	ba 08 00 00 00       	mov    $0x8,%edx
    34a6:	48 89 ce             	mov    %rcx,%rsi
    34a9:	48 89 c7             	mov    %rax,%rdi
    34ac:	e8 df ee ff ff       	callq  2390 <_ZNSi4readEPcl@plt>
    34b1:	48 8b 85 80 fd ff ff 	mov    -0x280(%rbp),%rax
    34b8:	48 83 c0 01          	add    $0x1,%rax
    34bc:	48 89 c2             	mov    %rax,%rdx
    34bf:	48 8d 85 c0 fd ff ff 	lea    -0x240(%rbp),%rax
    34c6:	48 89 d6             	mov    %rdx,%rsi
    34c9:	48 89 c7             	mov    %rax,%rdi
    34cc:	e8 49 0b 00 00       	callq  401a <_ZN7pvectorIlEC1Em>
    34d1:	48 8b 85 88 fd ff ff 	mov    -0x278(%rbp),%rax
    34d8:	48 ba fe ff ff ff ff 	movabs $0x1ffffffffffffffe,%rdx
    34df:	ff ff 1f 
    34e2:	48 39 d0             	cmp    %rdx,%rax
    34e5:	77 0e                	ja     34f5 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x1f1>
    34e7:	48 c1 e0 02          	shl    $0x2,%rax
    34eb:	48 89 c7             	mov    %rax,%rdi
    34ee:	e8 5d ed ff ff       	callq  2250 <_Znam@plt>
    34f3:	eb 05                	jmp    34fa <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x1f6>
    34f5:	e8 c6 ee ff ff       	callq  23c0 <__cxa_throw_bad_array_new_length@plt>
    34fa:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
    3501:	48 8b 85 80 fd ff ff 	mov    -0x280(%rbp),%rax
    3508:	48 83 c0 01          	add    $0x1,%rax
    350c:	48 c1 e0 03          	shl    $0x3,%rax
    3510:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
    3517:	48 8b 85 88 fd ff ff 	mov    -0x278(%rbp),%rax
    351e:	48 c1 e0 02          	shl    $0x2,%rax
    3522:	48 89 85 b8 fd ff ff 	mov    %rax,-0x248(%rbp)
    3529:	48 8d 85 c0 fd ff ff 	lea    -0x240(%rbp),%rax
    3530:	48 89 c7             	mov    %rax,%rdi
    3533:	e8 74 0b 00 00       	callq  40ac <_ZNK7pvectorIlE4dataEv>
    3538:	48 89 c1             	mov    %rax,%rcx
    353b:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
    3542:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    3549:	48 89 ce             	mov    %rcx,%rsi
    354c:	48 89 c7             	mov    %rax,%rdi
    354f:	e8 3c ee ff ff       	callq  2390 <_ZNSi4readEPcl@plt>
    3554:	48 8b 95 b8 fd ff ff 	mov    -0x248(%rbp),%rdx
    355b:	48 8b 8d a8 fd ff ff 	mov    -0x258(%rbp),%rcx
    3562:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    3569:	48 89 ce             	mov    %rcx,%rsi
    356c:	48 89 c7             	mov    %rax,%rdi
    356f:	e8 1c ee ff ff       	callq  2390 <_ZNSi4readEPcl@plt>
    3574:	48 8b 95 a8 fd ff ff 	mov    -0x258(%rbp),%rdx
    357b:	48 8d 85 c0 fd ff ff 	lea    -0x240(%rbp),%rax
    3582:	48 89 d6             	mov    %rdx,%rsi
    3585:	48 89 c7             	mov    %rax,%rdi
    3588:	e8 34 0b 00 00       	callq  40c1 <_ZN8CSRGraphIiiLb1EE8GenIndexERK7pvectorIlEPi>
    358d:	48 89 85 a0 fd ff ff 	mov    %rax,-0x260(%rbp)
    3594:	0f b6 85 7e fd ff ff 	movzbl -0x282(%rbp),%eax
    359b:	84 c0                	test   %al,%al
    359d:	0f 84 9b 00 00 00    	je     363e <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x33a>
    35a3:	48 8b 85 88 fd ff ff 	mov    -0x278(%rbp),%rax
    35aa:	48 ba fe ff ff ff ff 	movabs $0x1ffffffffffffffe,%rdx
    35b1:	ff ff 1f 
    35b4:	48 39 d0             	cmp    %rdx,%rax
    35b7:	77 0e                	ja     35c7 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x2c3>
    35b9:	48 c1 e0 02          	shl    $0x2,%rax
    35bd:	48 89 c7             	mov    %rax,%rdi
    35c0:	e8 8b ec ff ff       	callq  2250 <_Znam@plt>
    35c5:	eb 05                	jmp    35cc <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x2c8>
    35c7:	e8 f4 ed ff ff       	callq  23c0 <__cxa_throw_bad_array_new_length@plt>
    35cc:	48 89 85 90 fd ff ff 	mov    %rax,-0x270(%rbp)
    35d3:	48 8d 85 c0 fd ff ff 	lea    -0x240(%rbp),%rax
    35da:	48 89 c7             	mov    %rax,%rdi
    35dd:	e8 ca 0a 00 00       	callq  40ac <_ZNK7pvectorIlE4dataEv>
    35e2:	48 89 c1             	mov    %rax,%rcx
    35e5:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
    35ec:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    35f3:	48 89 ce             	mov    %rcx,%rsi
    35f6:	48 89 c7             	mov    %rax,%rdi
    35f9:	e8 92 ed ff ff       	callq  2390 <_ZNSi4readEPcl@plt>
    35fe:	48 8b 95 b8 fd ff ff 	mov    -0x248(%rbp),%rdx
    3605:	48 8b 8d 90 fd ff ff 	mov    -0x270(%rbp),%rcx
    360c:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    3613:	48 89 ce             	mov    %rcx,%rsi
    3616:	48 89 c7             	mov    %rax,%rdi
    3619:	e8 72 ed ff ff       	callq  2390 <_ZNSi4readEPcl@plt>
    361e:	48 8b 95 90 fd ff ff 	mov    -0x270(%rbp),%rdx
    3625:	48 8d 85 c0 fd ff ff 	lea    -0x240(%rbp),%rax
    362c:	48 89 d6             	mov    %rdx,%rsi
    362f:	48 89 c7             	mov    %rax,%rdi
    3632:	e8 8a 0a 00 00       	callq  40c1 <_ZN8CSRGraphIiiLb1EE8GenIndexERK7pvectorIlEPi>
    3637:	48 89 85 98 fd ff ff 	mov    %rax,-0x268(%rbp)
    363e:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    3645:	48 89 c7             	mov    %rax,%rdi
    3648:	e8 13 ec ff ff       	callq  2260 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv@plt>
    364d:	0f b6 85 7e fd ff ff 	movzbl -0x282(%rbp),%eax
    3654:	84 c0                	test   %al,%al
    3656:	74 3a                	je     3692 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x38e>
    3658:	48 8b b5 80 fd ff ff 	mov    -0x280(%rbp),%rsi
    365f:	4c 8b 85 90 fd ff ff 	mov    -0x270(%rbp),%r8
    3666:	48 8b bd 98 fd ff ff 	mov    -0x268(%rbp),%rdi
    366d:	48 8b 8d a8 fd ff ff 	mov    -0x258(%rbp),%rcx
    3674:	48 8b 95 a0 fd ff ff 	mov    -0x260(%rbp),%rdx
    367b:	48 8b 85 68 fd ff ff 	mov    -0x298(%rbp),%rax
    3682:	4d 89 c1             	mov    %r8,%r9
    3685:	49 89 f8             	mov    %rdi,%r8
    3688:	48 89 c7             	mov    %rax,%rdi
    368b:	e8 d8 0a 00 00       	callq  4168 <_ZN8CSRGraphIiiLb1EEC1ElPPiS1_S2_S1_>
    3690:	eb 24                	jmp    36b6 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x3b2>
    3692:	48 8b b5 80 fd ff ff 	mov    -0x280(%rbp),%rsi
    3699:	48 8b 8d a8 fd ff ff 	mov    -0x258(%rbp),%rcx
    36a0:	48 8b 95 a0 fd ff ff 	mov    -0x260(%rbp),%rdx
    36a7:	48 8b 85 68 fd ff ff 	mov    -0x298(%rbp),%rax
    36ae:	48 89 c7             	mov    %rax,%rdi
    36b1:	e8 52 0b 00 00       	callq  4208 <_ZN8CSRGraphIiiLb1EEC1ElPPiS1_>
    36b6:	48 8d 85 c0 fd ff ff 	lea    -0x240(%rbp),%rax
    36bd:	48 89 c7             	mov    %rax,%rdi
    36c0:	e8 c7 09 00 00       	callq  408c <_ZN7pvectorIlED1Ev>
    36c5:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    36cc:	48 89 c7             	mov    %rax,%rdi
    36cf:	e8 ac eb ff ff       	callq  2280 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@plt>
    36d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    36d8:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    36df:	00 00 
    36e1:	74 40                	je     3723 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x41f>
    36e3:	eb 39                	jmp    371e <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x41a>
    36e5:	f3 0f 1e fa          	endbr64 
    36e9:	48 89 c3             	mov    %rax,%rbx
    36ec:	48 8d 85 c0 fd ff ff 	lea    -0x240(%rbp),%rax
    36f3:	48 89 c7             	mov    %rax,%rdi
    36f6:	e8 91 09 00 00       	callq  408c <_ZN7pvectorIlED1Ev>
    36fb:	eb 07                	jmp    3704 <_ZN6ReaderIiiiLb1EE19ReadSerializedGraphEv+0x400>
    36fd:	f3 0f 1e fa          	endbr64 
    3701:	48 89 c3             	mov    %rax,%rbx
    3704:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    370b:	48 89 c7             	mov    %rax,%rdi
    370e:	e8 6d eb ff ff       	callq  2280 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@plt>
    3713:	48 89 d8             	mov    %rbx,%rax
    3716:	48 89 c7             	mov    %rax,%rdi
    3719:	e8 12 ed ff ff       	callq  2430 <_Unwind_Resume@plt>
    371e:	e8 4d ec ff ff       	callq  2370 <__stack_chk_fail@plt>
    3723:	48 8b 85 68 fd ff ff 	mov    -0x298(%rbp),%rax
    372a:	48 81 c4 98 02 00 00 	add    $0x298,%rsp
    3731:	5b                   	pop    %rbx
    3732:	5d                   	pop    %rbp
    3733:	c3                   	retq   

0000000000003734 <_ZN8CSRGraphIiiLb1EED1Ev>:
    3734:	f3 0f 1e fa          	endbr64 
    3738:	55                   	push   %rbp
    3739:	48 89 e5             	mov    %rsp,%rbp
    373c:	48 83 ec 10          	sub    $0x10,%rsp
    3740:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3744:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3748:	48 89 c7             	mov    %rax,%rdi
    374b:	e8 5e 0b 00 00       	callq  42ae <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv>
    3750:	90                   	nop
    3751:	c9                   	leaveq 
    3752:	c3                   	retq   
    3753:	90                   	nop

0000000000003754 <_ZNSaIiEC1Ev>:
    3754:	f3 0f 1e fa          	endbr64 
    3758:	55                   	push   %rbp
    3759:	48 89 e5             	mov    %rsp,%rbp
    375c:	48 83 ec 10          	sub    $0x10,%rsp
    3760:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3764:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3768:	48 89 c7             	mov    %rax,%rdi
    376b:	e8 04 0c 00 00       	callq  4374 <_ZN9__gnu_cxx13new_allocatorIiEC1Ev>
    3770:	90                   	nop
    3771:	c9                   	leaveq 
    3772:	c3                   	retq   
    3773:	90                   	nop

0000000000003774 <_ZNSt6vectorIiSaIiEEC1EmRKiRKS0_>:
    3774:	f3 0f 1e fa          	endbr64 
    3778:	55                   	push   %rbp
    3779:	48 89 e5             	mov    %rsp,%rbp
    377c:	53                   	push   %rbx
    377d:	48 83 ec 28          	sub    $0x28,%rsp
    3781:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3785:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    3789:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    378d:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    3791:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
    3795:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    3799:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    379d:	48 89 d6             	mov    %rdx,%rsi
    37a0:	48 89 c7             	mov    %rax,%rdi
    37a3:	e8 db 0b 00 00       	callq  4383 <_ZNSt6vectorIiSaIiEE17_S_check_init_lenEmRKS0_>
    37a8:	48 89 c1             	mov    %rax,%rcx
    37ab:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    37af:	48 89 c2             	mov    %rax,%rdx
    37b2:	48 89 ce             	mov    %rcx,%rsi
    37b5:	48 89 df             	mov    %rbx,%rdi
    37b8:	e8 4b 0c 00 00       	callq  4408 <_ZNSt12_Vector_baseIiSaIiEEC1EmRKS0_>
    37bd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    37c1:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    37c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    37c9:	48 89 ce             	mov    %rcx,%rsi
    37cc:	48 89 c7             	mov    %rax,%rdi
    37cf:	e8 9a 0c 00 00       	callq  446e <_ZNSt6vectorIiSaIiEE18_M_fill_initializeEmRKi>
    37d4:	eb 1e                	jmp    37f4 <_ZNSt6vectorIiSaIiEEC1EmRKiRKS0_+0x80>
    37d6:	f3 0f 1e fa          	endbr64 
    37da:	48 89 c3             	mov    %rax,%rbx
    37dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    37e1:	48 89 c7             	mov    %rax,%rdi
    37e4:	e8 63 f5 ff ff       	callq  2d4c <_ZNSt12_Vector_baseIiSaIiEED1Ev>
    37e9:	48 89 d8             	mov    %rbx,%rax
    37ec:	48 89 c7             	mov    %rax,%rdi
    37ef:	e8 3c ec ff ff       	callq  2430 <_Unwind_Resume@plt>
    37f4:	48 83 c4 28          	add    $0x28,%rsp
    37f8:	5b                   	pop    %rbx
    37f9:	5d                   	pop    %rbp
    37fa:	c3                   	retq   
    37fb:	90                   	nop

00000000000037fc <_ZNSt6vectorIiSaIiEE4backEv>:
    37fc:	f3 0f 1e fa          	endbr64 
    3800:	55                   	push   %rbp
    3801:	48 89 e5             	mov    %rsp,%rbp
    3804:	48 83 ec 30          	sub    $0x30,%rsp
    3808:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    380c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3813:	00 00 
    3815:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3819:	31 c0                	xor    %eax,%eax
    381b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    381f:	48 89 c7             	mov    %rax,%rdi
    3822:	e8 79 f8 ff ff       	callq  30a0 <_ZNSt6vectorIiSaIiEE3endEv>
    3827:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    382b:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
    382f:	be 01 00 00 00       	mov    $0x1,%esi
    3834:	48 89 c7             	mov    %rax,%rdi
    3837:	e8 7c 0c 00 00       	callq  44b8 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEmiEl>
    383c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    3840:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    3844:	48 89 c7             	mov    %rax,%rdi
    3847:	e8 4a f9 ff ff       	callq  3196 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv>
    384c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    3850:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    3857:	00 00 
    3859:	74 05                	je     3860 <_ZNSt6vectorIiSaIiEE4backEv+0x64>
    385b:	e8 10 eb ff ff       	callq  2370 <__stack_chk_fail@plt>
    3860:	c9                   	leaveq 
    3861:	c3                   	retq   

0000000000003862 <_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC1Ev>:
    3862:	f3 0f 1e fa          	endbr64 
    3866:	55                   	push   %rbp
    3867:	48 89 e5             	mov    %rsp,%rbp
    386a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    386e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3872:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    3879:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    387d:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    3884:	00 
    3885:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3889:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
    3890:	00 
    3891:	90                   	nop
    3892:	5d                   	pop    %rbp
    3893:	c3                   	retq   

0000000000003894 <_ZN9__gnu_cxx13new_allocatorIiED1Ev>:
    3894:	f3 0f 1e fa          	endbr64 
    3898:	55                   	push   %rbp
    3899:	48 89 e5             	mov    %rsp,%rbp
    389c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    38a0:	90                   	nop
    38a1:	5d                   	pop    %rbp
    38a2:	c3                   	retq   
    38a3:	90                   	nop

00000000000038a4 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim>:
    38a4:	f3 0f 1e fa          	endbr64 
    38a8:	55                   	push   %rbp
    38a9:	48 89 e5             	mov    %rsp,%rbp
    38ac:	48 83 ec 20          	sub    $0x20,%rsp
    38b0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    38b4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    38b8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    38bc:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    38c1:	74 17                	je     38da <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim+0x36>
    38c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    38c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    38cb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    38cf:	48 89 ce             	mov    %rcx,%rsi
    38d2:	48 89 c7             	mov    %rax,%rdi
    38d5:	e8 47 0c 00 00       	callq  4521 <_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim>
    38da:	90                   	nop
    38db:	c9                   	leaveq 
    38dc:	c3                   	retq   
    38dd:	90                   	nop

00000000000038de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>:
    38de:	f3 0f 1e fa          	endbr64 
    38e2:	55                   	push   %rbp
    38e3:	48 89 e5             	mov    %rsp,%rbp
    38e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    38ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    38ee:	5d                   	pop    %rbp
    38ef:	c3                   	retq   

00000000000038f0 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E>:
    38f0:	f3 0f 1e fa          	endbr64 
    38f4:	55                   	push   %rbp
    38f5:	48 89 e5             	mov    %rsp,%rbp
    38f8:	48 83 ec 20          	sub    $0x20,%rsp
    38fc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3900:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    3904:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    3908:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    390c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3910:	48 89 d6             	mov    %rdx,%rsi
    3913:	48 89 c7             	mov    %rax,%rdi
    3916:	e8 38 0c 00 00       	callq  4553 <_ZSt8_DestroyIPiEvT_S1_>
    391b:	90                   	nop
    391c:	c9                   	leaveq 
    391d:	c3                   	retq   

000000000000391e <_ZNKSt6vectorIiSaIiEE8max_sizeEv>:
    391e:	f3 0f 1e fa          	endbr64 
    3922:	55                   	push   %rbp
    3923:	48 89 e5             	mov    %rsp,%rbp
    3926:	48 83 ec 10          	sub    $0x10,%rsp
    392a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    392e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3932:	48 89 c7             	mov    %rax,%rdi
    3935:	e8 ac 0c 00 00       	callq  45e6 <_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    393a:	48 89 c7             	mov    %rax,%rdi
    393d:	e8 3b 0c 00 00       	callq  457d <_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_>
    3942:	c9                   	leaveq 
    3943:	c3                   	retq   

0000000000003944 <_ZNKSt6vectorIiSaIiEE8capacityEv>:
    3944:	f3 0f 1e fa          	endbr64 
    3948:	55                   	push   %rbp
    3949:	48 89 e5             	mov    %rsp,%rbp
    394c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3950:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3954:	48 8b 50 10          	mov    0x10(%rax),%rdx
    3958:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    395c:	48 8b 00             	mov    (%rax),%rax
    395f:	48 29 c2             	sub    %rax,%rdx
    3962:	48 89 d0             	mov    %rdx,%rax
    3965:	48 c1 f8 02          	sar    $0x2,%rax
    3969:	5d                   	pop    %rbp
    396a:	c3                   	retq   
    396b:	90                   	nop

000000000000396c <_ZNKSt6vectorIiSaIiEE4sizeEv>:
    396c:	f3 0f 1e fa          	endbr64 
    3970:	55                   	push   %rbp
    3971:	48 89 e5             	mov    %rsp,%rbp
    3974:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3978:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    397c:	48 8b 50 08          	mov    0x8(%rax),%rdx
    3980:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3984:	48 8b 00             	mov    (%rax),%rax
    3987:	48 29 c2             	sub    %rax,%rdx
    398a:	48 89 d0             	mov    %rdx,%rax
    398d:	48 c1 f8 02          	sar    $0x2,%rax
    3991:	5d                   	pop    %rbp
    3992:	c3                   	retq   
    3993:	90                   	nop

0000000000003994 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm>:
    3994:	f3 0f 1e fa          	endbr64 
    3998:	55                   	push   %rbp
    3999:	48 89 e5             	mov    %rsp,%rbp
    399c:	48 83 ec 10          	sub    $0x10,%rsp
    39a0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    39a4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    39a8:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    39ad:	74 15                	je     39c4 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm+0x30>
    39af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    39b3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    39b7:	48 89 d6             	mov    %rdx,%rsi
    39ba:	48 89 c7             	mov    %rax,%rdi
    39bd:	e8 36 0c 00 00       	callq  45f8 <_ZNSt16allocator_traitsISaIiEE8allocateERS0_m>
    39c2:	eb 05                	jmp    39c9 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm+0x35>
    39c4:	b8 00 00 00 00       	mov    $0x0,%eax
    39c9:	c9                   	leaveq 
    39ca:	c3                   	retq   

00000000000039cb <_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_>:
    39cb:	f3 0f 1e fa          	endbr64 
    39cf:	55                   	push   %rbp
    39d0:	48 89 e5             	mov    %rsp,%rbp
    39d3:	48 83 ec 30          	sub    $0x30,%rsp
    39d7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    39db:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    39df:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    39e3:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    39e7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    39ee:	00 00 
    39f0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    39f4:	31 c0                	xor    %eax,%eax
    39f6:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    39fa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    39fe:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
    3a02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3a06:	48 89 c7             	mov    %rax,%rdi
    3a09:	e8 18 0c 00 00       	callq  4626 <_ZNSt6vectorIiSaIiEE14_S_do_relocateEPiS2_S2_RS0_St17integral_constantIbLb1EE>
    3a0e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    3a12:	64 48 33 3c 25 28 00 	xor    %fs:0x28,%rdi
    3a19:	00 00 
    3a1b:	74 05                	je     3a22 <_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_+0x57>
    3a1d:	e8 4e e9 ff ff       	callq  2370 <__stack_chk_fail@plt>
    3a22:	c9                   	leaveq 
    3a23:	c3                   	retq   

0000000000003a24 <_ZSt32__make_move_if_noexcept_iteratorIiSt13move_iteratorIPiEET0_PT_>:
    3a24:	f3 0f 1e fa          	endbr64 
    3a28:	55                   	push   %rbp
    3a29:	48 89 e5             	mov    %rsp,%rbp
    3a2c:	48 83 ec 20          	sub    $0x20,%rsp
    3a30:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3a34:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3a3b:	00 00 
    3a3d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3a41:	31 c0                	xor    %eax,%eax
    3a43:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    3a47:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    3a4b:	48 89 d6             	mov    %rdx,%rsi
    3a4e:	48 89 c7             	mov    %rax,%rdi
    3a51:	e8 06 0c 00 00       	callq  465c <_ZNSt13move_iteratorIPiEC1ES0_>
    3a56:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3a5a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    3a5e:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    3a65:	00 00 
    3a67:	74 05                	je     3a6e <_ZSt32__make_move_if_noexcept_iteratorIiSt13move_iteratorIPiEET0_PT_+0x4a>
    3a69:	e8 02 e9 ff ff       	callq  2370 <__stack_chk_fail@plt>
    3a6e:	c9                   	leaveq 
    3a6f:	c3                   	retq   

0000000000003a70 <_ZNSt6vectorIiSaIiEE20_M_allocate_and_copyISt13move_iteratorIPiEEES4_mT_S6_>:
    3a70:	f3 0f 1e fa          	endbr64 
    3a74:	55                   	push   %rbp
    3a75:	48 89 e5             	mov    %rsp,%rbp
    3a78:	53                   	push   %rbx
    3a79:	48 83 ec 38          	sub    $0x38,%rsp
    3a7d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    3a81:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    3a85:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    3a89:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    3a8d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3a91:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    3a95:	48 89 d6             	mov    %rdx,%rsi
    3a98:	48 89 c7             	mov    %rax,%rdi
    3a9b:	e8 f4 fe ff ff       	callq  3994 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm>
    3aa0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3aa4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3aa8:	48 89 c7             	mov    %rax,%rdi
    3aab:	e8 2e fe ff ff       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    3ab0:	48 89 c1             	mov    %rax,%rcx
    3ab3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    3ab7:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
    3abb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3abf:	48 89 c7             	mov    %rax,%rdi
    3ac2:	e8 b3 0b 00 00       	callq  467a <_ZSt22__uninitialized_copy_aISt13move_iteratorIPiES1_iET0_T_S4_S3_RSaIT1_E>
    3ac7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3acb:	eb 3f                	jmp    3b0c <_ZNSt6vectorIiSaIiEE20_M_allocate_and_copyISt13move_iteratorIPiEEES4_mT_S6_+0x9c>
    3acd:	f3 0f 1e fa          	endbr64 
    3ad1:	48 89 c7             	mov    %rax,%rdi
    3ad4:	e8 d7 e7 ff ff       	callq  22b0 <__cxa_begin_catch@plt>
    3ad9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3add:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    3ae1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    3ae5:	48 89 ce             	mov    %rcx,%rsi
    3ae8:	48 89 c7             	mov    %rax,%rdi
    3aeb:	e8 b4 fd ff ff       	callq  38a4 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim>
    3af0:	e8 db e8 ff ff       	callq  23d0 <__cxa_rethrow@plt>
    3af5:	f3 0f 1e fa          	endbr64 
    3af9:	48 89 c3             	mov    %rax,%rbx
    3afc:	e8 1f e9 ff ff       	callq  2420 <__cxa_end_catch@plt>
    3b01:	48 89 d8             	mov    %rbx,%rax
    3b04:	48 89 c7             	mov    %rax,%rdi
    3b07:	e8 24 e9 ff ff       	callq  2430 <_Unwind_Resume@plt>
    3b0c:	48 83 c4 38          	add    $0x38,%rsp
    3b10:	5b                   	pop    %rbx
    3b11:	5d                   	pop    %rbp
    3b12:	c3                   	retq   

0000000000003b13 <_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_>:
    3b13:	f3 0f 1e fa          	endbr64 
    3b17:	55                   	push   %rbp
    3b18:	48 89 e5             	mov    %rsp,%rbp
    3b1b:	48 83 ec 20          	sub    $0x20,%rsp
    3b1f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3b23:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    3b27:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    3b2b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3b2f:	48 89 c7             	mov    %rax,%rdi
    3b32:	e8 78 0b 00 00       	callq  46af <_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE>
    3b37:	48 89 c2             	mov    %rax,%rdx
    3b3a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    3b3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3b42:	48 89 ce             	mov    %rcx,%rsi
    3b45:	48 89 c7             	mov    %rax,%rdi
    3b48:	e8 75 0b 00 00       	callq  46c2 <_ZN9__gnu_cxx13new_allocatorIiE9constructIiJRKiEEEvPT_DpOT0_>
    3b4d:	90                   	nop
    3b4e:	c9                   	leaveq 
    3b4f:	c3                   	retq   

0000000000003b50 <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_>:
    3b50:	f3 0f 1e fa          	endbr64 
    3b54:	55                   	push   %rbp
    3b55:	48 89 e5             	mov    %rsp,%rbp
    3b58:	53                   	push   %rbx
    3b59:	48 83 ec 68          	sub    $0x68,%rsp
    3b5d:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
    3b61:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
    3b65:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    3b69:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3b70:	00 00 
    3b72:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3b76:	31 c0                	xor    %eax,%eax
    3b78:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3b7c:	48 8d 15 ef 14 00 00 	lea    0x14ef(%rip),%rdx        # 5072 <_ZStL19piecewise_construct+0x6a>
    3b83:	be 01 00 00 00       	mov    $0x1,%esi
    3b88:	48 89 c7             	mov    %rax,%rdi
    3b8b:	e8 74 0b 00 00       	callq  4704 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc>
    3b90:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    3b94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3b98:	48 8b 00             	mov    (%rax),%rax
    3b9b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    3b9f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3ba3:	48 8b 40 08          	mov    0x8(%rax),%rax
    3ba7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3bab:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3baf:	48 89 c7             	mov    %rax,%rdi
    3bb2:	e8 9d f4 ff ff       	callq  3054 <_ZNSt6vectorIiSaIiEE5beginEv>
    3bb7:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    3bbb:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
    3bbf:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    3bc3:	48 89 d6             	mov    %rdx,%rsi
    3bc6:	48 89 c7             	mov    %rax,%rdi
    3bc9:	e8 26 0c 00 00       	callq  47f4 <_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_>
    3bce:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    3bd2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3bd6:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
    3bda:	48 89 d6             	mov    %rdx,%rsi
    3bdd:	48 89 c7             	mov    %rax,%rdi
    3be0:	e8 af fd ff ff       	callq  3994 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm>
    3be5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    3be9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3bed:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    3bf1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    3bf5:	48 89 c7             	mov    %rax,%rdi
    3bf8:	e8 b2 0a 00 00       	callq  46af <_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE>
    3bfd:	48 89 c2             	mov    %rax,%rdx
    3c00:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3c04:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    3c0b:	00 
    3c0c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3c10:	48 01 c1             	add    %rax,%rcx
    3c13:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3c17:	48 89 ce             	mov    %rcx,%rsi
    3c1a:	48 89 c7             	mov    %rax,%rdi
    3c1d:	e8 f1 fe ff ff       	callq  3b13 <_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_>
    3c22:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    3c29:	00 
    3c2a:	e8 cd f1 ff ff       	callq  2dfc <_ZNSt6vectorIiSaIiEE15_S_use_relocateEv>
    3c2f:	84 c0                	test   %al,%al
    3c31:	74 71                	je     3ca4 <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_+0x154>
    3c33:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3c37:	48 89 c7             	mov    %rax,%rdi
    3c3a:	e8 9f fc ff ff       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    3c3f:	48 89 c3             	mov    %rax,%rbx
    3c42:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    3c46:	48 89 c7             	mov    %rax,%rdi
    3c49:	e8 1c 02 00 00       	callq  3e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>
    3c4e:	48 8b 30             	mov    (%rax),%rsi
    3c51:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    3c55:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3c59:	48 89 d9             	mov    %rbx,%rcx
    3c5c:	48 89 c7             	mov    %rax,%rdi
    3c5f:	e8 67 fd ff ff       	callq  39cb <_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_>
    3c64:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    3c68:	48 83 45 b8 04       	addq   $0x4,-0x48(%rbp)
    3c6d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3c71:	48 89 c7             	mov    %rax,%rdi
    3c74:	e8 65 fc ff ff       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    3c79:	48 89 c3             	mov    %rax,%rbx
    3c7c:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    3c80:	48 89 c7             	mov    %rax,%rdi
    3c83:	e8 e2 01 00 00       	callq  3e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>
    3c88:	48 8b 00             	mov    (%rax),%rax
    3c8b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    3c8f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3c93:	48 89 d9             	mov    %rbx,%rcx
    3c96:	48 89 c7             	mov    %rax,%rdi
    3c99:	e8 2d fd ff ff       	callq  39cb <_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_>
    3c9e:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    3ca2:	eb 6f                	jmp    3d13 <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_+0x1c3>
    3ca4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3ca8:	48 89 c7             	mov    %rax,%rdi
    3cab:	e8 2e fc ff ff       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    3cb0:	48 89 c3             	mov    %rax,%rbx
    3cb3:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    3cb7:	48 89 c7             	mov    %rax,%rdi
    3cba:	e8 ab 01 00 00       	callq  3e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>
    3cbf:	48 8b 30             	mov    (%rax),%rsi
    3cc2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    3cc6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3cca:	48 89 d9             	mov    %rbx,%rcx
    3ccd:	48 89 c7             	mov    %rax,%rdi
    3cd0:	e8 63 0b 00 00       	callq  4838 <_ZSt34__uninitialized_move_if_noexcept_aIPiS0_SaIiEET0_T_S3_S2_RT1_>
    3cd5:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    3cd9:	48 83 45 b8 04       	addq   $0x4,-0x48(%rbp)
    3cde:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3ce2:	48 89 c7             	mov    %rax,%rdi
    3ce5:	e8 f4 fb ff ff       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    3cea:	48 89 c3             	mov    %rax,%rbx
    3ced:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    3cf1:	48 89 c7             	mov    %rax,%rdi
    3cf4:	e8 71 01 00 00       	callq  3e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>
    3cf9:	48 8b 00             	mov    (%rax),%rax
    3cfc:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    3d00:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    3d04:	48 89 d9             	mov    %rbx,%rcx
    3d07:	48 89 c7             	mov    %rax,%rdi
    3d0a:	e8 29 0b 00 00       	callq  4838 <_ZSt34__uninitialized_move_if_noexcept_aIPiS0_SaIiEET0_T_S3_S2_RT1_>
    3d0f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    3d13:	e8 e4 f0 ff ff       	callq  2dfc <_ZNSt6vectorIiSaIiEE15_S_use_relocateEv>
    3d18:	83 f0 01             	xor    $0x1,%eax
    3d1b:	84 c0                	test   %al,%al
    3d1d:	74 22                	je     3d41 <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_+0x1f1>
    3d1f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3d23:	48 89 c7             	mov    %rax,%rdi
    3d26:	e8 b3 fb ff ff       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    3d2b:	48 89 c2             	mov    %rax,%rdx
    3d2e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    3d32:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3d36:	48 89 ce             	mov    %rcx,%rsi
    3d39:	48 89 c7             	mov    %rax,%rdi
    3d3c:	e8 af fb ff ff       	callq  38f0 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E>
    3d41:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3d45:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
    3d49:	48 8b 52 10          	mov    0x10(%rdx),%rdx
    3d4d:	48 2b 55 c8          	sub    -0x38(%rbp),%rdx
    3d51:	48 c1 fa 02          	sar    $0x2,%rdx
    3d55:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3d59:	48 89 ce             	mov    %rcx,%rsi
    3d5c:	48 89 c7             	mov    %rax,%rdi
    3d5f:	e8 40 fb ff ff       	callq  38a4 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim>
    3d64:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3d68:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    3d6c:	48 89 10             	mov    %rdx,(%rax)
    3d6f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3d73:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
    3d77:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3d7b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    3d7f:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    3d86:	00 
    3d87:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3d8b:	48 01 c2             	add    %rax,%rdx
    3d8e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3d92:	48 89 50 10          	mov    %rdx,0x10(%rax)
    3d96:	90                   	nop
    3d97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3d9b:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3da2:	00 00 
    3da4:	0f 84 96 00 00 00    	je     3e40 <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_+0x2f0>
    3daa:	e9 8c 00 00 00       	jmpq   3e3b <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_+0x2eb>
    3daf:	f3 0f 1e fa          	endbr64 
    3db3:	48 89 c7             	mov    %rax,%rdi
    3db6:	e8 f5 e4 ff ff       	callq  22b0 <__cxa_begin_catch@plt>
    3dbb:	48 83 7d b8 00       	cmpq   $0x0,-0x48(%rbp)
    3dc0:	75 24                	jne    3de6 <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_+0x296>
    3dc2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3dc6:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    3dcd:	00 
    3dce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3dd2:	48 01 c2             	add    %rax,%rdx
    3dd5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3dd9:	48 89 d6             	mov    %rdx,%rsi
    3ddc:	48 89 c7             	mov    %rax,%rdi
    3ddf:	e8 ac 0a 00 00       	callq  4890 <_ZNSt16allocator_traitsISaIiEE7destroyIiEEvRS0_PT_>
    3de4:	eb 22                	jmp    3e08 <_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_+0x2b8>
    3de6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3dea:	48 89 c7             	mov    %rax,%rdi
    3ded:	e8 ec fa ff ff       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    3df2:	48 89 c2             	mov    %rax,%rdx
    3df5:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    3df9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3dfd:	48 89 ce             	mov    %rcx,%rsi
    3e00:	48 89 c7             	mov    %rax,%rdi
    3e03:	e8 e8 fa ff ff       	callq  38f0 <_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E>
    3e08:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3e0c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
    3e10:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    3e14:	48 89 ce             	mov    %rcx,%rsi
    3e17:	48 89 c7             	mov    %rax,%rdi
    3e1a:	e8 85 fa ff ff       	callq  38a4 <_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim>
    3e1f:	e8 ac e5 ff ff       	callq  23d0 <__cxa_rethrow@plt>
    3e24:	f3 0f 1e fa          	endbr64 
    3e28:	48 89 c3             	mov    %rax,%rbx
    3e2b:	e8 f0 e5 ff ff       	callq  2420 <__cxa_end_catch@plt>
    3e30:	48 89 d8             	mov    %rbx,%rax
    3e33:	48 89 c7             	mov    %rax,%rdi
    3e36:	e8 f5 e5 ff ff       	callq  2430 <_Unwind_Resume@plt>
    3e3b:	e8 30 e5 ff ff       	callq  2370 <__stack_chk_fail@plt>
    3e40:	48 83 c4 68          	add    $0x68,%rsp
    3e44:	5b                   	pop    %rbx
    3e45:	5d                   	pop    %rbp
    3e46:	c3                   	retq   
    3e47:	90                   	nop

0000000000003e48 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC1ERKS1_>:
    3e48:	f3 0f 1e fa          	endbr64 
    3e4c:	55                   	push   %rbp
    3e4d:	48 89 e5             	mov    %rsp,%rbp
    3e50:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3e54:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    3e58:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3e5c:	48 8b 10             	mov    (%rax),%rdx
    3e5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3e63:	48 89 10             	mov    %rdx,(%rax)
    3e66:	90                   	nop
    3e67:	5d                   	pop    %rbp
    3e68:	c3                   	retq   
    3e69:	90                   	nop

0000000000003e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>:
    3e6a:	f3 0f 1e fa          	endbr64 
    3e6e:	55                   	push   %rbp
    3e6f:	48 89 e5             	mov    %rsp,%rbp
    3e72:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3e76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3e7a:	5d                   	pop    %rbp
    3e7b:	c3                   	retq   

0000000000003e7c <_ZN8CSRGraphIiiLb1EE12NeighborhoodC1EiPPim>:
    3e7c:	f3 0f 1e fa          	endbr64 
    3e80:	55                   	push   %rbp
    3e81:	48 89 e5             	mov    %rsp,%rbp
    3e84:	53                   	push   %rbx
    3e85:	48 83 ec 38          	sub    $0x38,%rsp
    3e89:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    3e8d:	89 75 d4             	mov    %esi,-0x2c(%rbp)
    3e90:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    3e94:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    3e98:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3e9f:	00 00 
    3ea1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3ea5:	31 c0                	xor    %eax,%eax
    3ea7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3eab:	8b 55 d4             	mov    -0x2c(%rbp),%edx
    3eae:	89 10                	mov    %edx,(%rax)
    3eb0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3eb4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    3eb8:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3ebc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3ec0:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
    3ec7:	00 
    3ec8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3ecc:	48 89 c7             	mov    %rax,%rdi
    3ecf:	e8 4c f3 ff ff       	callq  3220 <_ZN8CSRGraphIiiLb1EE12Neighborhood3endEv>
    3ed4:	48 89 c3             	mov    %rax,%rbx
    3ed7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3edb:	48 89 c7             	mov    %rax,%rdi
    3ede:	e8 05 f3 ff ff       	callq  31e8 <_ZN8CSRGraphIiiLb1EE12Neighborhood5beginEv>
    3ee3:	48 29 c3             	sub    %rax,%rbx
    3ee6:	48 89 d8             	mov    %rbx,%rax
    3ee9:	48 c1 f8 02          	sar    $0x2,%rax
    3eed:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    3ef1:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
    3ef5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    3ef9:	48 89 d6             	mov    %rdx,%rsi
    3efc:	48 89 c7             	mov    %rax,%rdi
    3eff:	e8 b6 09 00 00       	callq  48ba <_ZSt3minImERKT_S2_S2_>
    3f04:	48 8b 10             	mov    (%rax),%rdx
    3f07:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3f0b:	48 89 50 10          	mov    %rdx,0x10(%rax)
    3f0f:	90                   	nop
    3f10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3f14:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3f1b:	00 00 
    3f1d:	74 05                	je     3f24 <_ZN8CSRGraphIiiLb1EE12NeighborhoodC1EiPPim+0xa8>
    3f1f:	e8 4c e4 ff ff       	callq  2370 <__stack_chk_fail@plt>
    3f24:	48 83 c4 38          	add    $0x38,%rsp
    3f28:	5b                   	pop    %rbx
    3f29:	5d                   	pop    %rbp
    3f2a:	c3                   	retq   
    3f2b:	90                   	nop

0000000000003f2c <_ZN6ReaderIiiiLb1EE9GetSuffixB5cxx11Ev>:
    3f2c:	f3 0f 1e fa          	endbr64 
    3f30:	55                   	push   %rbp
    3f31:	48 89 e5             	mov    %rsp,%rbp
    3f34:	48 83 ec 20          	sub    $0x20,%rsp
    3f38:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3f3c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    3f40:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3f47:	00 00 
    3f49:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3f4d:	31 c0                	xor    %eax,%eax
    3f4f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3f53:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    3f5a:	be 2e 00 00 00       	mov    $0x2e,%esi
    3f5f:	48 89 c7             	mov    %rax,%rdi
    3f62:	e8 e9 e4 ff ff       	callq  2450 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEcm@plt>
    3f67:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    3f6b:	48 83 7d f0 ff       	cmpq   $0xffffffffffffffff,-0x10(%rbp)
    3f70:	75 44                	jne    3fb6 <_ZN6ReaderIiiiLb1EE9GetSuffixB5cxx11Ev+0x8a>
    3f72:	48 8d 35 13 11 00 00 	lea    0x1113(%rip),%rsi        # 508c <_ZStL19piecewise_construct+0x84>
    3f79:	48 8d 3d c0 40 00 00 	lea    0x40c0(%rip),%rdi        # 8040 <_ZSt4cout@@GLIBCXX_3.4>
    3f80:	e8 9b e3 ff ff       	callq  2320 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    3f85:	48 89 c2             	mov    %rax,%rdx
    3f88:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3f8c:	48 89 c6             	mov    %rax,%rsi
    3f8f:	48 89 d7             	mov    %rdx,%rdi
    3f92:	e8 69 e3 ff ff       	callq  2300 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>
    3f97:	48 89 c2             	mov    %rax,%rdx
    3f9a:	48 8b 05 2f 40 00 00 	mov    0x402f(%rip),%rax        # 7fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    3fa1:	48 89 c6             	mov    %rax,%rsi
    3fa4:	48 89 d7             	mov    %rdx,%rdi
    3fa7:	e8 a4 e3 ff ff       	callq  2350 <_ZNSolsEPFRSoS_E@plt>
    3fac:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    3fb1:	e8 ca e3 ff ff       	callq  2380 <exit@plt>
    3fb6:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
    3fba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3fbe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    3fc2:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    3fc9:	48 89 c7             	mov    %rax,%rdi
    3fcc:	e8 6f e3 ff ff       	callq  2340 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@plt>
    3fd1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3fd5:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3fdc:	00 00 
    3fde:	74 05                	je     3fe5 <_ZN6ReaderIiiiLb1EE9GetSuffixB5cxx11Ev+0xb9>
    3fe0:	e8 8b e3 ff ff       	callq  2370 <__stack_chk_fail@plt>
    3fe5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3fe9:	c9                   	leaveq 
    3fea:	c3                   	retq   

0000000000003feb <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_>:
    3feb:	f3 0f 1e fa          	endbr64 
    3fef:	55                   	push   %rbp
    3ff0:	48 89 e5             	mov    %rsp,%rbp
    3ff3:	48 83 ec 10          	sub    $0x10,%rsp
    3ff7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3ffb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    3fff:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    4003:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4007:	48 89 d6             	mov    %rdx,%rsi
    400a:	48 89 c7             	mov    %rax,%rdi
    400d:	e8 7e e2 ff ff       	callq  2290 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@plt>
    4012:	85 c0                	test   %eax,%eax
    4014:	0f 94 c0             	sete   %al
    4017:	c9                   	leaveq 
    4018:	c3                   	retq   
    4019:	90                   	nop

000000000000401a <_ZN7pvectorIlEC1Em>:
    401a:	f3 0f 1e fa          	endbr64 
    401e:	55                   	push   %rbp
    401f:	48 89 e5             	mov    %rsp,%rbp
    4022:	48 83 ec 10          	sub    $0x10,%rsp
    4026:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    402a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    402e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    4032:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffffff,%rdx
    4039:	ff ff 0f 
    403c:	48 39 d0             	cmp    %rdx,%rax
    403f:	77 06                	ja     4047 <_ZN7pvectorIlEC1Em+0x2d>
    4041:	48 c1 e0 03          	shl    $0x3,%rax
    4045:	eb 05                	jmp    404c <_ZN7pvectorIlEC1Em+0x32>
    4047:	e8 74 e3 ff ff       	callq  23c0 <__cxa_throw_bad_array_new_length@plt>
    404c:	48 89 c7             	mov    %rax,%rdi
    404f:	e8 fc e1 ff ff       	callq  2250 <_Znam@plt>
    4054:	48 89 c2             	mov    %rax,%rdx
    4057:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    405b:	48 89 10             	mov    %rdx,(%rax)
    405e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4062:	48 8b 00             	mov    (%rax),%rax
    4065:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    4069:	48 c1 e2 03          	shl    $0x3,%rdx
    406d:	48 01 c2             	add    %rax,%rdx
    4070:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4074:	48 89 50 08          	mov    %rdx,0x8(%rax)
    4078:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    407c:	48 8b 50 08          	mov    0x8(%rax),%rdx
    4080:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4084:	48 89 50 10          	mov    %rdx,0x10(%rax)
    4088:	90                   	nop
    4089:	c9                   	leaveq 
    408a:	c3                   	retq   
    408b:	90                   	nop

000000000000408c <_ZN7pvectorIlED1Ev>:
    408c:	f3 0f 1e fa          	endbr64 
    4090:	55                   	push   %rbp
    4091:	48 89 e5             	mov    %rsp,%rbp
    4094:	48 83 ec 10          	sub    $0x10,%rsp
    4098:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    409c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    40a0:	48 89 c7             	mov    %rax,%rdi
    40a3:	e8 42 08 00 00       	callq  48ea <_ZN7pvectorIlE16ReleaseResourcesEv>
    40a8:	90                   	nop
    40a9:	c9                   	leaveq 
    40aa:	c3                   	retq   
    40ab:	90                   	nop

00000000000040ac <_ZNK7pvectorIlE4dataEv>:
    40ac:	f3 0f 1e fa          	endbr64 
    40b0:	55                   	push   %rbp
    40b1:	48 89 e5             	mov    %rsp,%rbp
    40b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    40b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    40bc:	48 8b 00             	mov    (%rax),%rax
    40bf:	5d                   	pop    %rbp
    40c0:	c3                   	retq   

00000000000040c1 <_ZN8CSRGraphIiiLb1EE8GenIndexERK7pvectorIlEPi>:
    40c1:	f3 0f 1e fa          	endbr64 
    40c5:	55                   	push   %rbp
    40c6:	48 89 e5             	mov    %rsp,%rbp
    40c9:	48 83 ec 20          	sub    $0x20,%rsp
    40cd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    40d1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    40d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    40d9:	48 89 c7             	mov    %rax,%rdi
    40dc:	e8 43 08 00 00       	callq  4924 <_ZNK7pvectorIlE4sizeEv>
    40e1:	89 45 f4             	mov    %eax,-0xc(%rbp)
    40e4:	8b 45 f4             	mov    -0xc(%rbp),%eax
    40e7:	48 98                	cltq   
    40e9:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffffff,%rdx
    40f0:	ff ff 0f 
    40f3:	48 39 d0             	cmp    %rdx,%rax
    40f6:	77 19                	ja     4111 <_ZN8CSRGraphIiiLb1EE8GenIndexERK7pvectorIlEPi+0x50>
    40f8:	48 c1 e0 03          	shl    $0x3,%rax
    40fc:	48 89 c7             	mov    %rax,%rdi
    40ff:	e8 4c e1 ff ff       	callq  2250 <_Znam@plt>
    4104:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    4108:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    410f:	eb 05                	jmp    4116 <_ZN8CSRGraphIiiLb1EE8GenIndexERK7pvectorIlEPi+0x55>
    4111:	e8 aa e2 ff ff       	callq  23c0 <__cxa_throw_bad_array_new_length@plt>
    4116:	8b 45 f0             	mov    -0x10(%rbp),%eax
    4119:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    411c:	7d 44                	jge    4162 <_ZN8CSRGraphIiiLb1EE8GenIndexERK7pvectorIlEPi+0xa1>
    411e:	8b 45 f0             	mov    -0x10(%rbp),%eax
    4121:	48 63 d0             	movslq %eax,%rdx
    4124:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4128:	48 89 d6             	mov    %rdx,%rsi
    412b:	48 89 c7             	mov    %rax,%rdi
    412e:	e8 19 08 00 00       	callq  494c <_ZNK7pvectorIlEixEm>
    4133:	48 8b 00             	mov    (%rax),%rax
    4136:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    413d:	00 
    413e:	8b 45 f0             	mov    -0x10(%rbp),%eax
    4141:	48 98                	cltq   
    4143:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    414a:	00 
    414b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    414f:	48 01 d0             	add    %rdx,%rax
    4152:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    4156:	48 01 ca             	add    %rcx,%rdx
    4159:	48 89 10             	mov    %rdx,(%rax)
    415c:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    4160:	eb b4                	jmp    4116 <_ZN8CSRGraphIiiLb1EE8GenIndexERK7pvectorIlEPi+0x55>
    4162:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4166:	c9                   	leaveq 
    4167:	c3                   	retq   

0000000000004168 <_ZN8CSRGraphIiiLb1EEC1ElPPiS1_S2_S1_>:
    4168:	f3 0f 1e fa          	endbr64 
    416c:	55                   	push   %rbp
    416d:	48 89 e5             	mov    %rsp,%rbp
    4170:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4174:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4178:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    417c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    4180:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    4184:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    4188:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    418c:	c6 00 01             	movb   $0x1,(%rax)
    418f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4193:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    4197:	48 89 50 08          	mov    %rdx,0x8(%rax)
    419b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    419f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    41a3:	48 89 50 18          	mov    %rdx,0x18(%rax)
    41a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    41ab:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    41af:	48 89 50 20          	mov    %rdx,0x20(%rax)
    41b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    41b7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    41bb:	48 89 50 28          	mov    %rdx,0x28(%rax)
    41bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    41c3:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    41c7:	48 89 50 30          	mov    %rdx,0x30(%rax)
    41cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    41cf:	48 8b 50 18          	mov    0x18(%rax),%rdx
    41d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    41d7:	48 8b 40 08          	mov    0x8(%rax),%rax
    41db:	48 c1 e0 03          	shl    $0x3,%rax
    41df:	48 01 d0             	add    %rdx,%rax
    41e2:	48 8b 10             	mov    (%rax),%rdx
    41e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    41e9:	48 8b 40 18          	mov    0x18(%rax),%rax
    41ed:	48 8b 00             	mov    (%rax),%rax
    41f0:	48 29 c2             	sub    %rax,%rdx
    41f3:	48 89 d0             	mov    %rdx,%rax
    41f6:	48 c1 f8 02          	sar    $0x2,%rax
    41fa:	48 89 c2             	mov    %rax,%rdx
    41fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4201:	48 89 50 10          	mov    %rdx,0x10(%rax)
    4205:	90                   	nop
    4206:	5d                   	pop    %rbp
    4207:	c3                   	retq   

0000000000004208 <_ZN8CSRGraphIiiLb1EEC1ElPPiS1_>:
    4208:	f3 0f 1e fa          	endbr64 
    420c:	55                   	push   %rbp
    420d:	48 89 e5             	mov    %rsp,%rbp
    4210:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4214:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4218:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    421c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    4220:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4224:	c6 00 00             	movb   $0x0,(%rax)
    4227:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    422b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    422f:	48 89 50 08          	mov    %rdx,0x8(%rax)
    4233:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4237:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    423b:	48 89 50 18          	mov    %rdx,0x18(%rax)
    423f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4243:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    4247:	48 89 50 20          	mov    %rdx,0x20(%rax)
    424b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    424f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    4253:	48 89 50 28          	mov    %rdx,0x28(%rax)
    4257:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    425b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    425f:	48 89 50 30          	mov    %rdx,0x30(%rax)
    4263:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4267:	48 8b 50 18          	mov    0x18(%rax),%rdx
    426b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    426f:	48 8b 40 08          	mov    0x8(%rax),%rax
    4273:	48 c1 e0 03          	shl    $0x3,%rax
    4277:	48 01 d0             	add    %rdx,%rax
    427a:	48 8b 10             	mov    (%rax),%rdx
    427d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4281:	48 8b 40 18          	mov    0x18(%rax),%rax
    4285:	48 8b 00             	mov    (%rax),%rax
    4288:	48 29 c2             	sub    %rax,%rdx
    428b:	48 89 d0             	mov    %rdx,%rax
    428e:	48 c1 f8 02          	sar    $0x2,%rax
    4292:	48 89 c2             	mov    %rax,%rdx
    4295:	48 c1 ea 3f          	shr    $0x3f,%rdx
    4299:	48 01 d0             	add    %rdx,%rax
    429c:	48 d1 f8             	sar    %rax
    429f:	48 89 c2             	mov    %rax,%rdx
    42a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    42a6:	48 89 50 10          	mov    %rdx,0x10(%rax)
    42aa:	90                   	nop
    42ab:	5d                   	pop    %rbp
    42ac:	c3                   	retq   
    42ad:	90                   	nop

00000000000042ae <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv>:
    42ae:	f3 0f 1e fa          	endbr64 
    42b2:	55                   	push   %rbp
    42b3:	48 89 e5             	mov    %rsp,%rbp
    42b6:	48 83 ec 10          	sub    $0x10,%rsp
    42ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    42be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    42c2:	48 8b 40 18          	mov    0x18(%rax),%rax
    42c6:	48 85 c0             	test   %rax,%rax
    42c9:	74 1d                	je     42e8 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0x3a>
    42cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    42cf:	48 8b 40 18          	mov    0x18(%rax),%rax
    42d3:	48 85 c0             	test   %rax,%rax
    42d6:	74 10                	je     42e8 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0x3a>
    42d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    42dc:	48 8b 40 18          	mov    0x18(%rax),%rax
    42e0:	48 89 c7             	mov    %rax,%rdi
    42e3:	e8 b8 e0 ff ff       	callq  23a0 <_ZdaPv@plt>
    42e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    42ec:	48 8b 40 20          	mov    0x20(%rax),%rax
    42f0:	48 85 c0             	test   %rax,%rax
    42f3:	74 1d                	je     4312 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0x64>
    42f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    42f9:	48 8b 40 20          	mov    0x20(%rax),%rax
    42fd:	48 85 c0             	test   %rax,%rax
    4300:	74 10                	je     4312 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0x64>
    4302:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4306:	48 8b 40 20          	mov    0x20(%rax),%rax
    430a:	48 89 c7             	mov    %rax,%rdi
    430d:	e8 8e e0 ff ff       	callq  23a0 <_ZdaPv@plt>
    4312:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4316:	0f b6 00             	movzbl (%rax),%eax
    4319:	84 c0                	test   %al,%al
    431b:	74 54                	je     4371 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0xc3>
    431d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4321:	48 8b 40 28          	mov    0x28(%rax),%rax
    4325:	48 85 c0             	test   %rax,%rax
    4328:	74 1d                	je     4347 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0x99>
    432a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    432e:	48 8b 40 28          	mov    0x28(%rax),%rax
    4332:	48 85 c0             	test   %rax,%rax
    4335:	74 10                	je     4347 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0x99>
    4337:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    433b:	48 8b 40 28          	mov    0x28(%rax),%rax
    433f:	48 89 c7             	mov    %rax,%rdi
    4342:	e8 59 e0 ff ff       	callq  23a0 <_ZdaPv@plt>
    4347:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    434b:	48 8b 40 30          	mov    0x30(%rax),%rax
    434f:	48 85 c0             	test   %rax,%rax
    4352:	74 1d                	je     4371 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0xc3>
    4354:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4358:	48 8b 40 30          	mov    0x30(%rax),%rax
    435c:	48 85 c0             	test   %rax,%rax
    435f:	74 10                	je     4371 <_ZN8CSRGraphIiiLb1EE16ReleaseResourcesEv+0xc3>
    4361:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4365:	48 8b 40 30          	mov    0x30(%rax),%rax
    4369:	48 89 c7             	mov    %rax,%rdi
    436c:	e8 2f e0 ff ff       	callq  23a0 <_ZdaPv@plt>
    4371:	90                   	nop
    4372:	c9                   	leaveq 
    4373:	c3                   	retq   

0000000000004374 <_ZN9__gnu_cxx13new_allocatorIiEC1Ev>:
    4374:	f3 0f 1e fa          	endbr64 
    4378:	55                   	push   %rbp
    4379:	48 89 e5             	mov    %rsp,%rbp
    437c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4380:	90                   	nop
    4381:	5d                   	pop    %rbp
    4382:	c3                   	retq   

0000000000004383 <_ZNSt6vectorIiSaIiEE17_S_check_init_lenEmRKS0_>:
    4383:	f3 0f 1e fa          	endbr64 
    4387:	55                   	push   %rbp
    4388:	48 89 e5             	mov    %rsp,%rbp
    438b:	53                   	push   %rbx
    438c:	48 83 ec 28          	sub    $0x28,%rsp
    4390:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    4394:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    4398:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    439f:	00 00 
    43a1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    43a5:	31 c0                	xor    %eax,%eax
    43a7:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    43ab:	48 8d 45 e7          	lea    -0x19(%rbp),%rax
    43af:	48 89 d6             	mov    %rdx,%rsi
    43b2:	48 89 c7             	mov    %rax,%rdi
    43b5:	e8 b6 05 00 00       	callq  4970 <_ZNSaIiEC1ERKS_>
    43ba:	48 8d 45 e7          	lea    -0x19(%rbp),%rax
    43be:	48 89 c7             	mov    %rax,%rdi
    43c1:	e8 b7 01 00 00       	callq  457d <_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_>
    43c6:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
    43ca:	0f 97 c3             	seta   %bl
    43cd:	48 8d 45 e7          	lea    -0x19(%rbp),%rax
    43d1:	48 89 c7             	mov    %rax,%rdi
    43d4:	e8 53 e9 ff ff       	callq  2d2c <_ZNSaIiED1Ev>
    43d9:	84 db                	test   %bl,%bl
    43db:	74 0c                	je     43e9 <_ZNSt6vectorIiSaIiEE17_S_check_init_lenEmRKS0_+0x66>
    43dd:	48 8d 3d c4 0c 00 00 	lea    0xcc4(%rip),%rdi        # 50a8 <_ZStL19piecewise_construct+0xa0>
    43e4:	e8 e7 de ff ff       	callq  22d0 <_ZSt20__throw_length_errorPKc@plt>
    43e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    43ed:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    43f1:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    43f8:	00 00 
    43fa:	74 05                	je     4401 <_ZNSt6vectorIiSaIiEE17_S_check_init_lenEmRKS0_+0x7e>
    43fc:	e8 6f df ff ff       	callq  2370 <__stack_chk_fail@plt>
    4401:	48 83 c4 28          	add    $0x28,%rsp
    4405:	5b                   	pop    %rbx
    4406:	5d                   	pop    %rbp
    4407:	c3                   	retq   

0000000000004408 <_ZNSt12_Vector_baseIiSaIiEEC1EmRKS0_>:
    4408:	f3 0f 1e fa          	endbr64 
    440c:	55                   	push   %rbp
    440d:	48 89 e5             	mov    %rsp,%rbp
    4410:	53                   	push   %rbx
    4411:	48 83 ec 28          	sub    $0x28,%rsp
    4415:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4419:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    441d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4421:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4425:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4429:	48 89 d6             	mov    %rdx,%rsi
    442c:	48 89 c7             	mov    %rax,%rdi
    442f:	e8 66 05 00 00       	callq  499a <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1ERKS0_>
    4434:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    4438:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    443c:	48 89 d6             	mov    %rdx,%rsi
    443f:	48 89 c7             	mov    %rax,%rdi
    4442:	e8 89 05 00 00       	callq  49d0 <_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEm>
    4447:	eb 1e                	jmp    4467 <_ZNSt12_Vector_baseIiSaIiEEC1EmRKS0_+0x5f>
    4449:	f3 0f 1e fa          	endbr64 
    444d:	48 89 c3             	mov    %rax,%rbx
    4450:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4454:	48 89 c7             	mov    %rax,%rdi
    4457:	e8 00 e8 ff ff       	callq  2c5c <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev>
    445c:	48 89 d8             	mov    %rbx,%rax
    445f:	48 89 c7             	mov    %rax,%rdi
    4462:	e8 c9 df ff ff       	callq  2430 <_Unwind_Resume@plt>
    4467:	48 83 c4 28          	add    $0x28,%rsp
    446b:	5b                   	pop    %rbx
    446c:	5d                   	pop    %rbp
    446d:	c3                   	retq   

000000000000446e <_ZNSt6vectorIiSaIiEE18_M_fill_initializeEmRKi>:
    446e:	f3 0f 1e fa          	endbr64 
    4472:	55                   	push   %rbp
    4473:	48 89 e5             	mov    %rsp,%rbp
    4476:	48 83 ec 20          	sub    $0x20,%rsp
    447a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    447e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4482:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4486:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    448a:	48 89 c7             	mov    %rax,%rdi
    448d:	e8 4c f4 ff ff       	callq  38de <_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>
    4492:	48 89 c1             	mov    %rax,%rcx
    4495:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4499:	48 8b 00             	mov    (%rax),%rax
    449c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    44a0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    44a4:	48 89 c7             	mov    %rax,%rdi
    44a7:	e8 7e 05 00 00       	callq  4a2a <_ZSt24__uninitialized_fill_n_aIPimiiET_S1_T0_RKT1_RSaIT2_E>
    44ac:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    44b0:	48 89 42 08          	mov    %rax,0x8(%rdx)
    44b4:	90                   	nop
    44b5:	c9                   	leaveq 
    44b6:	c3                   	retq   
    44b7:	90                   	nop

00000000000044b8 <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEmiEl>:
    44b8:	f3 0f 1e fa          	endbr64 
    44bc:	55                   	push   %rbp
    44bd:	48 89 e5             	mov    %rsp,%rbp
    44c0:	48 83 ec 30          	sub    $0x30,%rsp
    44c4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    44c8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    44cc:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    44d3:	00 00 
    44d5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    44d9:	31 c0                	xor    %eax,%eax
    44db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    44df:	48 8b 00             	mov    (%rax),%rax
    44e2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    44e6:	48 c1 e2 02          	shl    $0x2,%rdx
    44ea:	48 f7 da             	neg    %rdx
    44ed:	48 01 d0             	add    %rdx,%rax
    44f0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    44f4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
    44f8:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    44fc:	48 89 d6             	mov    %rdx,%rsi
    44ff:	48 89 c7             	mov    %rax,%rdi
    4502:	e8 41 f9 ff ff       	callq  3e48 <_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC1ERKS1_>
    4507:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    450b:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    450f:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    4516:	00 00 
    4518:	74 05                	je     451f <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEmiEl+0x67>
    451a:	e8 51 de ff ff       	callq  2370 <__stack_chk_fail@plt>
    451f:	c9                   	leaveq 
    4520:	c3                   	retq   

0000000000004521 <_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim>:
    4521:	f3 0f 1e fa          	endbr64 
    4525:	55                   	push   %rbp
    4526:	48 89 e5             	mov    %rsp,%rbp
    4529:	48 83 ec 20          	sub    $0x20,%rsp
    452d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4531:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4535:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4539:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    453d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    4541:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4545:	48 89 ce             	mov    %rcx,%rsi
    4548:	48 89 c7             	mov    %rax,%rdi
    454b:	e8 10 05 00 00       	callq  4a60 <_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim>
    4550:	90                   	nop
    4551:	c9                   	leaveq 
    4552:	c3                   	retq   

0000000000004553 <_ZSt8_DestroyIPiEvT_S1_>:
    4553:	f3 0f 1e fa          	endbr64 
    4557:	55                   	push   %rbp
    4558:	48 89 e5             	mov    %rsp,%rbp
    455b:	48 83 ec 10          	sub    $0x10,%rsp
    455f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4563:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4567:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    456b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    456f:	48 89 d6             	mov    %rdx,%rsi
    4572:	48 89 c7             	mov    %rax,%rdi
    4575:	e8 0d 05 00 00       	callq  4a87 <_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_>
    457a:	90                   	nop
    457b:	c9                   	leaveq 
    457c:	c3                   	retq   

000000000000457d <_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_>:
    457d:	f3 0f 1e fa          	endbr64 
    4581:	55                   	push   %rbp
    4582:	48 89 e5             	mov    %rsp,%rbp
    4585:	48 83 ec 30          	sub    $0x30,%rsp
    4589:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    458d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    4594:	00 00 
    4596:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    459a:	31 c0                	xor    %eax,%eax
    459c:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffffff,%rax
    45a3:	ff ff 1f 
    45a6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    45aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    45ae:	48 89 c7             	mov    %rax,%rdi
    45b1:	e8 e4 04 00 00       	callq  4a9a <_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_>
    45b6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    45ba:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
    45be:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
    45c2:	48 89 d6             	mov    %rdx,%rsi
    45c5:	48 89 c7             	mov    %rax,%rdi
    45c8:	e8 ed 02 00 00       	callq  48ba <_ZSt3minImERKT_S2_S2_>
    45cd:	48 8b 00             	mov    (%rax),%rax
    45d0:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    45d4:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    45db:	00 00 
    45dd:	74 05                	je     45e4 <_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_+0x67>
    45df:	e8 8c dd ff ff       	callq  2370 <__stack_chk_fail@plt>
    45e4:	c9                   	leaveq 
    45e5:	c3                   	retq   

00000000000045e6 <_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv>:
    45e6:	f3 0f 1e fa          	endbr64 
    45ea:	55                   	push   %rbp
    45eb:	48 89 e5             	mov    %rsp,%rbp
    45ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    45f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    45f6:	5d                   	pop    %rbp
    45f7:	c3                   	retq   

00000000000045f8 <_ZNSt16allocator_traitsISaIiEE8allocateERS0_m>:
    45f8:	f3 0f 1e fa          	endbr64 
    45fc:	55                   	push   %rbp
    45fd:	48 89 e5             	mov    %rsp,%rbp
    4600:	48 83 ec 10          	sub    $0x10,%rsp
    4604:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4608:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    460c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    4610:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4614:	ba 00 00 00 00       	mov    $0x0,%edx
    4619:	48 89 ce             	mov    %rcx,%rsi
    461c:	48 89 c7             	mov    %rax,%rdi
    461f:	e8 94 04 00 00       	callq  4ab8 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv>
    4624:	c9                   	leaveq 
    4625:	c3                   	retq   

0000000000004626 <_ZNSt6vectorIiSaIiEE14_S_do_relocateEPiS2_S2_RS0_St17integral_constantIbLb1EE>:
    4626:	f3 0f 1e fa          	endbr64 
    462a:	55                   	push   %rbp
    462b:	48 89 e5             	mov    %rsp,%rbp
    462e:	48 83 ec 20          	sub    $0x20,%rsp
    4632:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4636:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    463a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    463e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    4642:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    4646:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    464a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    464e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4652:	48 89 c7             	mov    %rax,%rdi
    4655:	e8 a4 04 00 00       	callq  4afe <_ZSt12__relocate_aIPiS0_SaIiEET0_T_S3_S2_RT1_>
    465a:	c9                   	leaveq 
    465b:	c3                   	retq   

000000000000465c <_ZNSt13move_iteratorIPiEC1ES0_>:
    465c:	f3 0f 1e fa          	endbr64 
    4660:	55                   	push   %rbp
    4661:	48 89 e5             	mov    %rsp,%rbp
    4664:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4668:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    466c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4670:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    4674:	48 89 10             	mov    %rdx,(%rax)
    4677:	90                   	nop
    4678:	5d                   	pop    %rbp
    4679:	c3                   	retq   

000000000000467a <_ZSt22__uninitialized_copy_aISt13move_iteratorIPiES1_iET0_T_S4_S3_RSaIT1_E>:
    467a:	f3 0f 1e fa          	endbr64 
    467e:	55                   	push   %rbp
    467f:	48 89 e5             	mov    %rsp,%rbp
    4682:	48 83 ec 20          	sub    $0x20,%rsp
    4686:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    468a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    468e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4692:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    4696:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    469a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    469e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    46a2:	48 89 ce             	mov    %rcx,%rsi
    46a5:	48 89 c7             	mov    %rax,%rdi
    46a8:	e8 b8 04 00 00       	callq  4b65 <_ZSt18uninitialized_copyISt13move_iteratorIPiES1_ET0_T_S4_S3_>
    46ad:	c9                   	leaveq 
    46ae:	c3                   	retq   

00000000000046af <_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE>:
    46af:	f3 0f 1e fa          	endbr64 
    46b3:	55                   	push   %rbp
    46b4:	48 89 e5             	mov    %rsp,%rbp
    46b7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    46bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    46bf:	5d                   	pop    %rbp
    46c0:	c3                   	retq   
    46c1:	90                   	nop

00000000000046c2 <_ZN9__gnu_cxx13new_allocatorIiE9constructIiJRKiEEEvPT_DpOT0_>:
    46c2:	f3 0f 1e fa          	endbr64 
    46c6:	55                   	push   %rbp
    46c7:	48 89 e5             	mov    %rsp,%rbp
    46ca:	53                   	push   %rbx
    46cb:	48 83 ec 28          	sub    $0x28,%rsp
    46cf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    46d3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    46d7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    46db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    46df:	48 89 c7             	mov    %rax,%rdi
    46e2:	e8 c8 ff ff ff       	callq  46af <_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE>
    46e7:	8b 18                	mov    (%rax),%ebx
    46e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    46ed:	48 89 c6             	mov    %rax,%rsi
    46f0:	bf 04 00 00 00       	mov    $0x4,%edi
    46f5:	e8 4c e5 ff ff       	callq  2c46 <_ZnwmPv>
    46fa:	89 18                	mov    %ebx,(%rax)
    46fc:	90                   	nop
    46fd:	48 83 c4 28          	add    $0x28,%rsp
    4701:	5b                   	pop    %rbx
    4702:	5d                   	pop    %rbp
    4703:	c3                   	retq   

0000000000004704 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc>:
    4704:	f3 0f 1e fa          	endbr64 
    4708:	55                   	push   %rbp
    4709:	48 89 e5             	mov    %rsp,%rbp
    470c:	53                   	push   %rbx
    470d:	48 83 ec 48          	sub    $0x48,%rsp
    4711:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    4715:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    4719:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    471d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    4724:	00 00 
    4726:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    472a:	31 c0                	xor    %eax,%eax
    472c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    4730:	48 89 c7             	mov    %rax,%rdi
    4733:	e8 e6 f1 ff ff       	callq  391e <_ZNKSt6vectorIiSaIiEE8max_sizeEv>
    4738:	48 89 c3             	mov    %rax,%rbx
    473b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    473f:	48 89 c7             	mov    %rax,%rdi
    4742:	e8 25 f2 ff ff       	callq  396c <_ZNKSt6vectorIiSaIiEE4sizeEv>
    4747:	48 29 c3             	sub    %rax,%rbx
    474a:	48 89 da             	mov    %rbx,%rdx
    474d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    4751:	48 39 c2             	cmp    %rax,%rdx
    4754:	0f 92 c0             	setb   %al
    4757:	84 c0                	test   %al,%al
    4759:	74 0c                	je     4767 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0x63>
    475b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    475f:	48 89 c7             	mov    %rax,%rdi
    4762:	e8 69 db ff ff       	callq  22d0 <_ZSt20__throw_length_errorPKc@plt>
    4767:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    476b:	48 89 c7             	mov    %rax,%rdi
    476e:	e8 f9 f1 ff ff       	callq  396c <_ZNKSt6vectorIiSaIiEE4sizeEv>
    4773:	48 89 c3             	mov    %rax,%rbx
    4776:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    477a:	48 89 c7             	mov    %rax,%rdi
    477d:	e8 ea f1 ff ff       	callq  396c <_ZNKSt6vectorIiSaIiEE4sizeEv>
    4782:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    4786:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
    478a:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
    478e:	48 89 d6             	mov    %rdx,%rsi
    4791:	48 89 c7             	mov    %rax,%rdi
    4794:	e8 01 04 00 00       	callq  4b9a <_ZSt3maxImERKT_S2_S2_>
    4799:	48 8b 00             	mov    (%rax),%rax
    479c:	48 01 d8             	add    %rbx,%rax
    479f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    47a3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    47a7:	48 89 c7             	mov    %rax,%rdi
    47aa:	e8 bd f1 ff ff       	callq  396c <_ZNKSt6vectorIiSaIiEE4sizeEv>
    47af:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
    47b3:	72 12                	jb     47c7 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xc3>
    47b5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    47b9:	48 89 c7             	mov    %rax,%rdi
    47bc:	e8 5d f1 ff ff       	callq  391e <_ZNKSt6vectorIiSaIiEE8max_sizeEv>
    47c1:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
    47c5:	76 0e                	jbe    47d5 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xd1>
    47c7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    47cb:	48 89 c7             	mov    %rax,%rdi
    47ce:	e8 4b f1 ff ff       	callq  391e <_ZNKSt6vectorIiSaIiEE8max_sizeEv>
    47d3:	eb 04                	jmp    47d9 <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xd5>
    47d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    47d9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    47dd:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    47e4:	00 00 
    47e6:	74 05                	je     47ed <_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc+0xe9>
    47e8:	e8 83 db ff ff       	callq  2370 <__stack_chk_fail@plt>
    47ed:	48 83 c4 48          	add    $0x48,%rsp
    47f1:	5b                   	pop    %rbx
    47f2:	5d                   	pop    %rbp
    47f3:	c3                   	retq   

00000000000047f4 <_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_>:
    47f4:	f3 0f 1e fa          	endbr64 
    47f8:	55                   	push   %rbp
    47f9:	48 89 e5             	mov    %rsp,%rbp
    47fc:	53                   	push   %rbx
    47fd:	48 83 ec 18          	sub    $0x18,%rsp
    4801:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4805:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4809:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    480d:	48 89 c7             	mov    %rax,%rdi
    4810:	e8 55 f6 ff ff       	callq  3e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>
    4815:	48 8b 18             	mov    (%rax),%rbx
    4818:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    481c:	48 89 c7             	mov    %rax,%rdi
    481f:	e8 46 f6 ff ff       	callq  3e6a <_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv>
    4824:	48 8b 00             	mov    (%rax),%rax
    4827:	48 29 c3             	sub    %rax,%rbx
    482a:	48 89 d8             	mov    %rbx,%rax
    482d:	48 c1 f8 02          	sar    $0x2,%rax
    4831:	48 83 c4 18          	add    $0x18,%rsp
    4835:	5b                   	pop    %rbx
    4836:	5d                   	pop    %rbp
    4837:	c3                   	retq   

0000000000004838 <_ZSt34__uninitialized_move_if_noexcept_aIPiS0_SaIiEET0_T_S3_S2_RT1_>:
    4838:	f3 0f 1e fa          	endbr64 
    483c:	55                   	push   %rbp
    483d:	48 89 e5             	mov    %rsp,%rbp
    4840:	53                   	push   %rbx
    4841:	48 83 ec 28          	sub    $0x28,%rsp
    4845:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4849:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    484d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4851:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    4855:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4859:	48 89 c7             	mov    %rax,%rdi
    485c:	e8 c3 f1 ff ff       	callq  3a24 <_ZSt32__make_move_if_noexcept_iteratorIiSt13move_iteratorIPiEET0_PT_>
    4861:	48 89 c3             	mov    %rax,%rbx
    4864:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4868:	48 89 c7             	mov    %rax,%rdi
    486b:	e8 b4 f1 ff ff       	callq  3a24 <_ZSt32__make_move_if_noexcept_iteratorIiSt13move_iteratorIPiEET0_PT_>
    4870:	48 89 c7             	mov    %rax,%rdi
    4873:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    4877:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    487b:	48 89 d1             	mov    %rdx,%rcx
    487e:	48 89 c2             	mov    %rax,%rdx
    4881:	48 89 de             	mov    %rbx,%rsi
    4884:	e8 f1 fd ff ff       	callq  467a <_ZSt22__uninitialized_copy_aISt13move_iteratorIPiES1_iET0_T_S4_S3_RSaIT1_E>
    4889:	48 83 c4 28          	add    $0x28,%rsp
    488d:	5b                   	pop    %rbx
    488e:	5d                   	pop    %rbp
    488f:	c3                   	retq   

0000000000004890 <_ZNSt16allocator_traitsISaIiEE7destroyIiEEvRS0_PT_>:
    4890:	f3 0f 1e fa          	endbr64 
    4894:	55                   	push   %rbp
    4895:	48 89 e5             	mov    %rsp,%rbp
    4898:	48 83 ec 10          	sub    $0x10,%rsp
    489c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    48a0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    48a4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    48a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    48ac:	48 89 d6             	mov    %rdx,%rsi
    48af:	48 89 c7             	mov    %rax,%rdi
    48b2:	e8 13 03 00 00       	callq  4bca <_ZN9__gnu_cxx13new_allocatorIiE7destroyIiEEvPT_>
    48b7:	90                   	nop
    48b8:	c9                   	leaveq 
    48b9:	c3                   	retq   

00000000000048ba <_ZSt3minImERKT_S2_S2_>:
    48ba:	f3 0f 1e fa          	endbr64 
    48be:	55                   	push   %rbp
    48bf:	48 89 e5             	mov    %rsp,%rbp
    48c2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    48c6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    48ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    48ce:	48 8b 10             	mov    (%rax),%rdx
    48d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    48d5:	48 8b 00             	mov    (%rax),%rax
    48d8:	48 39 c2             	cmp    %rax,%rdx
    48db:	73 06                	jae    48e3 <_ZSt3minImERKT_S2_S2_+0x29>
    48dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    48e1:	eb 04                	jmp    48e7 <_ZSt3minImERKT_S2_S2_+0x2d>
    48e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    48e7:	5d                   	pop    %rbp
    48e8:	c3                   	retq   
    48e9:	90                   	nop

00000000000048ea <_ZN7pvectorIlE16ReleaseResourcesEv>:
    48ea:	f3 0f 1e fa          	endbr64 
    48ee:	55                   	push   %rbp
    48ef:	48 89 e5             	mov    %rsp,%rbp
    48f2:	48 83 ec 10          	sub    $0x10,%rsp
    48f6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    48fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    48fe:	48 8b 00             	mov    (%rax),%rax
    4901:	48 85 c0             	test   %rax,%rax
    4904:	74 1b                	je     4921 <_ZN7pvectorIlE16ReleaseResourcesEv+0x37>
    4906:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    490a:	48 8b 00             	mov    (%rax),%rax
    490d:	48 85 c0             	test   %rax,%rax
    4910:	74 0f                	je     4921 <_ZN7pvectorIlE16ReleaseResourcesEv+0x37>
    4912:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4916:	48 8b 00             	mov    (%rax),%rax
    4919:	48 89 c7             	mov    %rax,%rdi
    491c:	e8 7f da ff ff       	callq  23a0 <_ZdaPv@plt>
    4921:	90                   	nop
    4922:	c9                   	leaveq 
    4923:	c3                   	retq   

0000000000004924 <_ZNK7pvectorIlE4sizeEv>:
    4924:	f3 0f 1e fa          	endbr64 
    4928:	55                   	push   %rbp
    4929:	48 89 e5             	mov    %rsp,%rbp
    492c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4930:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4934:	48 8b 50 08          	mov    0x8(%rax),%rdx
    4938:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    493c:	48 8b 00             	mov    (%rax),%rax
    493f:	48 29 c2             	sub    %rax,%rdx
    4942:	48 89 d0             	mov    %rdx,%rax
    4945:	48 c1 f8 03          	sar    $0x3,%rax
    4949:	5d                   	pop    %rbp
    494a:	c3                   	retq   
    494b:	90                   	nop

000000000000494c <_ZNK7pvectorIlEixEm>:
    494c:	f3 0f 1e fa          	endbr64 
    4950:	55                   	push   %rbp
    4951:	48 89 e5             	mov    %rsp,%rbp
    4954:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4958:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    495c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4960:	48 8b 00             	mov    (%rax),%rax
    4963:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    4967:	48 c1 e2 03          	shl    $0x3,%rdx
    496b:	48 01 d0             	add    %rdx,%rax
    496e:	5d                   	pop    %rbp
    496f:	c3                   	retq   

0000000000004970 <_ZNSaIiEC1ERKS_>:
    4970:	f3 0f 1e fa          	endbr64 
    4974:	55                   	push   %rbp
    4975:	48 89 e5             	mov    %rsp,%rbp
    4978:	48 83 ec 10          	sub    $0x10,%rsp
    497c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4980:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4984:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    4988:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    498c:	48 89 d6             	mov    %rdx,%rsi
    498f:	48 89 c7             	mov    %rax,%rdi
    4992:	e8 47 02 00 00       	callq  4bde <_ZN9__gnu_cxx13new_allocatorIiEC1ERKS1_>
    4997:	90                   	nop
    4998:	c9                   	leaveq 
    4999:	c3                   	retq   

000000000000499a <_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1ERKS0_>:
    499a:	f3 0f 1e fa          	endbr64 
    499e:	55                   	push   %rbp
    499f:	48 89 e5             	mov    %rsp,%rbp
    49a2:	48 83 ec 10          	sub    $0x10,%rsp
    49a6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    49aa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    49ae:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    49b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    49b6:	48 89 d6             	mov    %rdx,%rsi
    49b9:	48 89 c7             	mov    %rax,%rdi
    49bc:	e8 af ff ff ff       	callq  4970 <_ZNSaIiEC1ERKS_>
    49c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    49c5:	48 89 c7             	mov    %rax,%rdi
    49c8:	e8 95 ee ff ff       	callq  3862 <_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC1Ev>
    49cd:	90                   	nop
    49ce:	c9                   	leaveq 
    49cf:	c3                   	retq   

00000000000049d0 <_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEm>:
    49d0:	f3 0f 1e fa          	endbr64 
    49d4:	55                   	push   %rbp
    49d5:	48 89 e5             	mov    %rsp,%rbp
    49d8:	48 83 ec 10          	sub    $0x10,%rsp
    49dc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    49e0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    49e4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    49e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    49ec:	48 89 d6             	mov    %rdx,%rsi
    49ef:	48 89 c7             	mov    %rax,%rdi
    49f2:	e8 9d ef ff ff       	callq  3994 <_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm>
    49f7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    49fb:	48 89 02             	mov    %rax,(%rdx)
    49fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4a02:	48 8b 10             	mov    (%rax),%rdx
    4a05:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4a09:	48 89 50 08          	mov    %rdx,0x8(%rax)
    4a0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4a11:	48 8b 00             	mov    (%rax),%rax
    4a14:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    4a18:	48 c1 e2 02          	shl    $0x2,%rdx
    4a1c:	48 01 c2             	add    %rax,%rdx
    4a1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4a23:	48 89 50 10          	mov    %rdx,0x10(%rax)
    4a27:	90                   	nop
    4a28:	c9                   	leaveq 
    4a29:	c3                   	retq   

0000000000004a2a <_ZSt24__uninitialized_fill_n_aIPimiiET_S1_T0_RKT1_RSaIT2_E>:
    4a2a:	f3 0f 1e fa          	endbr64 
    4a2e:	55                   	push   %rbp
    4a2f:	48 89 e5             	mov    %rsp,%rbp
    4a32:	48 83 ec 20          	sub    $0x20,%rsp
    4a36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4a3a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4a3e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4a42:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    4a46:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    4a4a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    4a4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4a52:	48 89 ce             	mov    %rcx,%rsi
    4a55:	48 89 c7             	mov    %rax,%rdi
    4a58:	e8 94 01 00 00       	callq  4bf1 <_ZSt20uninitialized_fill_nIPimiET_S1_T0_RKT1_>
    4a5d:	c9                   	leaveq 
    4a5e:	c3                   	retq   
    4a5f:	90                   	nop

0000000000004a60 <_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim>:
    4a60:	f3 0f 1e fa          	endbr64 
    4a64:	55                   	push   %rbp
    4a65:	48 89 e5             	mov    %rsp,%rbp
    4a68:	48 83 ec 20          	sub    $0x20,%rsp
    4a6c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4a70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4a74:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4a78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    4a7c:	48 89 c7             	mov    %rax,%rdi
    4a7f:	e8 8c d8 ff ff       	callq  2310 <_ZdlPv@plt>
    4a84:	90                   	nop
    4a85:	c9                   	leaveq 
    4a86:	c3                   	retq   

0000000000004a87 <_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_>:
    4a87:	f3 0f 1e fa          	endbr64 
    4a8b:	55                   	push   %rbp
    4a8c:	48 89 e5             	mov    %rsp,%rbp
    4a8f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4a93:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4a97:	90                   	nop
    4a98:	5d                   	pop    %rbp
    4a99:	c3                   	retq   

0000000000004a9a <_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_>:
    4a9a:	f3 0f 1e fa          	endbr64 
    4a9e:	55                   	push   %rbp
    4a9f:	48 89 e5             	mov    %rsp,%rbp
    4aa2:	48 83 ec 10          	sub    $0x10,%rsp
    4aa6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4aaa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4aae:	48 89 c7             	mov    %rax,%rdi
    4ab1:	e8 70 01 00 00       	callq  4c26 <_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv>
    4ab6:	c9                   	leaveq 
    4ab7:	c3                   	retq   

0000000000004ab8 <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv>:
    4ab8:	f3 0f 1e fa          	endbr64 
    4abc:	55                   	push   %rbp
    4abd:	48 89 e5             	mov    %rsp,%rbp
    4ac0:	48 83 ec 20          	sub    $0x20,%rsp
    4ac4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4ac8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4acc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4ad0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4ad4:	48 89 c7             	mov    %rax,%rdi
    4ad7:	e8 4a 01 00 00       	callq  4c26 <_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv>
    4adc:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
    4ae0:	0f 97 c0             	seta   %al
    4ae3:	84 c0                	test   %al,%al
    4ae5:	74 05                	je     4aec <_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv+0x34>
    4ae7:	e8 b4 d7 ff ff       	callq  22a0 <_ZSt17__throw_bad_allocv@plt>
    4aec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    4af0:	48 c1 e0 02          	shl    $0x2,%rax
    4af4:	48 89 c7             	mov    %rax,%rdi
    4af7:	e8 34 d8 ff ff       	callq  2330 <_Znwm@plt>
    4afc:	c9                   	leaveq 
    4afd:	c3                   	retq   

0000000000004afe <_ZSt12__relocate_aIPiS0_SaIiEET0_T_S3_S2_RT1_>:
    4afe:	f3 0f 1e fa          	endbr64 
    4b02:	55                   	push   %rbp
    4b03:	48 89 e5             	mov    %rsp,%rbp
    4b06:	41 54                	push   %r12
    4b08:	53                   	push   %rbx
    4b09:	48 83 ec 20          	sub    $0x20,%rsp
    4b0d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4b11:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4b15:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4b19:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    4b1d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4b21:	48 89 c7             	mov    %rax,%rdi
    4b24:	e8 15 01 00 00       	callq  4c3e <_ZSt12__niter_baseIPiET_S1_>
    4b29:	49 89 c4             	mov    %rax,%r12
    4b2c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4b30:	48 89 c7             	mov    %rax,%rdi
    4b33:	e8 06 01 00 00       	callq  4c3e <_ZSt12__niter_baseIPiET_S1_>
    4b38:	48 89 c3             	mov    %rax,%rbx
    4b3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4b3f:	48 89 c7             	mov    %rax,%rdi
    4b42:	e8 f7 00 00 00       	callq  4c3e <_ZSt12__niter_baseIPiET_S1_>
    4b47:	48 89 c7             	mov    %rax,%rdi
    4b4a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    4b4e:	48 89 c1             	mov    %rax,%rcx
    4b51:	4c 89 e2             	mov    %r12,%rdx
    4b54:	48 89 de             	mov    %rbx,%rsi
    4b57:	e8 f4 00 00 00       	callq  4c50 <_ZSt14__relocate_a_1IiiENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E>
    4b5c:	48 83 c4 20          	add    $0x20,%rsp
    4b60:	5b                   	pop    %rbx
    4b61:	41 5c                	pop    %r12
    4b63:	5d                   	pop    %rbp
    4b64:	c3                   	retq   

0000000000004b65 <_ZSt18uninitialized_copyISt13move_iteratorIPiES1_ET0_T_S4_S3_>:
    4b65:	f3 0f 1e fa          	endbr64 
    4b69:	55                   	push   %rbp
    4b6a:	48 89 e5             	mov    %rsp,%rbp
    4b6d:	48 83 ec 30          	sub    $0x30,%rsp
    4b71:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4b75:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4b79:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4b7d:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    4b81:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4b85:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    4b89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4b8d:	48 89 ce             	mov    %rcx,%rsi
    4b90:	48 89 c7             	mov    %rax,%rdi
    4b93:	e8 1f 01 00 00       	callq  4cb7 <_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPiES3_EET0_T_S6_S5_>
    4b98:	c9                   	leaveq 
    4b99:	c3                   	retq   

0000000000004b9a <_ZSt3maxImERKT_S2_S2_>:
    4b9a:	f3 0f 1e fa          	endbr64 
    4b9e:	55                   	push   %rbp
    4b9f:	48 89 e5             	mov    %rsp,%rbp
    4ba2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4ba6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4baa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4bae:	48 8b 10             	mov    (%rax),%rdx
    4bb1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    4bb5:	48 8b 00             	mov    (%rax),%rax
    4bb8:	48 39 c2             	cmp    %rax,%rdx
    4bbb:	73 06                	jae    4bc3 <_ZSt3maxImERKT_S2_S2_+0x29>
    4bbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    4bc1:	eb 04                	jmp    4bc7 <_ZSt3maxImERKT_S2_S2_+0x2d>
    4bc3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4bc7:	5d                   	pop    %rbp
    4bc8:	c3                   	retq   
    4bc9:	90                   	nop

0000000000004bca <_ZN9__gnu_cxx13new_allocatorIiE7destroyIiEEvPT_>:
    4bca:	f3 0f 1e fa          	endbr64 
    4bce:	55                   	push   %rbp
    4bcf:	48 89 e5             	mov    %rsp,%rbp
    4bd2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4bd6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4bda:	90                   	nop
    4bdb:	5d                   	pop    %rbp
    4bdc:	c3                   	retq   
    4bdd:	90                   	nop

0000000000004bde <_ZN9__gnu_cxx13new_allocatorIiEC1ERKS1_>:
    4bde:	f3 0f 1e fa          	endbr64 
    4be2:	55                   	push   %rbp
    4be3:	48 89 e5             	mov    %rsp,%rbp
    4be6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4bea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4bee:	90                   	nop
    4bef:	5d                   	pop    %rbp
    4bf0:	c3                   	retq   

0000000000004bf1 <_ZSt20uninitialized_fill_nIPimiET_S1_T0_RKT1_>:
    4bf1:	f3 0f 1e fa          	endbr64 
    4bf5:	55                   	push   %rbp
    4bf6:	48 89 e5             	mov    %rsp,%rbp
    4bf9:	48 83 ec 30          	sub    $0x30,%rsp
    4bfd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4c01:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4c05:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4c09:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    4c0d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4c11:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    4c15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4c19:	48 89 ce             	mov    %rcx,%rsi
    4c1c:	48 89 c7             	mov    %rax,%rdi
    4c1f:	e8 c4 00 00 00       	callq  4ce8 <_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPimiEET_S3_T0_RKT1_>
    4c24:	c9                   	leaveq 
    4c25:	c3                   	retq   

0000000000004c26 <_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv>:
    4c26:	f3 0f 1e fa          	endbr64 
    4c2a:	55                   	push   %rbp
    4c2b:	48 89 e5             	mov    %rsp,%rbp
    4c2e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4c32:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffffff,%rax
    4c39:	ff ff 1f 
    4c3c:	5d                   	pop    %rbp
    4c3d:	c3                   	retq   

0000000000004c3e <_ZSt12__niter_baseIPiET_S1_>:
    4c3e:	f3 0f 1e fa          	endbr64 
    4c42:	55                   	push   %rbp
    4c43:	48 89 e5             	mov    %rsp,%rbp
    4c46:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4c4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4c4e:	5d                   	pop    %rbp
    4c4f:	c3                   	retq   

0000000000004c50 <_ZSt14__relocate_a_1IiiENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E>:
    4c50:	f3 0f 1e fa          	endbr64 
    4c54:	55                   	push   %rbp
    4c55:	48 89 e5             	mov    %rsp,%rbp
    4c58:	48 83 ec 30          	sub    $0x30,%rsp
    4c5c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4c60:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4c64:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4c68:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    4c6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4c70:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
    4c74:	48 c1 f8 02          	sar    $0x2,%rax
    4c78:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    4c7c:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    4c81:	7e 1f                	jle    4ca2 <_ZSt14__relocate_a_1IiiENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E+0x52>
    4c83:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4c87:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    4c8e:	00 
    4c8f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    4c93:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4c97:	48 89 ce             	mov    %rcx,%rsi
    4c9a:	48 89 c7             	mov    %rax,%rdi
    4c9d:	e8 6e d7 ff ff       	callq  2410 <memmove@plt>
    4ca2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4ca6:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    4cad:	00 
    4cae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4cb2:	48 01 d0             	add    %rdx,%rax
    4cb5:	c9                   	leaveq 
    4cb6:	c3                   	retq   

0000000000004cb7 <_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPiES3_EET0_T_S6_S5_>:
    4cb7:	f3 0f 1e fa          	endbr64 
    4cbb:	55                   	push   %rbp
    4cbc:	48 89 e5             	mov    %rsp,%rbp
    4cbf:	48 83 ec 20          	sub    $0x20,%rsp
    4cc3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4cc7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4ccb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4ccf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    4cd3:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    4cd7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4cdb:	48 89 ce             	mov    %rcx,%rsi
    4cde:	48 89 c7             	mov    %rax,%rdi
    4ce1:	e8 33 00 00 00       	callq  4d19 <_ZSt4copyISt13move_iteratorIPiES1_ET0_T_S4_S3_>
    4ce6:	c9                   	leaveq 
    4ce7:	c3                   	retq   

0000000000004ce8 <_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPimiEET_S3_T0_RKT1_>:
    4ce8:	f3 0f 1e fa          	endbr64 
    4cec:	55                   	push   %rbp
    4ced:	48 89 e5             	mov    %rsp,%rbp
    4cf0:	48 83 ec 20          	sub    $0x20,%rsp
    4cf4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4cf8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4cfc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4d00:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    4d04:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    4d08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4d0c:	48 89 ce             	mov    %rcx,%rsi
    4d0f:	48 89 c7             	mov    %rax,%rdi
    4d12:	e8 52 00 00 00       	callq  4d69 <_ZSt6fill_nIPimiET_S1_T0_RKT1_>
    4d17:	c9                   	leaveq 
    4d18:	c3                   	retq   

0000000000004d19 <_ZSt4copyISt13move_iteratorIPiES1_ET0_T_S4_S3_>:
    4d19:	f3 0f 1e fa          	endbr64 
    4d1d:	55                   	push   %rbp
    4d1e:	48 89 e5             	mov    %rsp,%rbp
    4d21:	53                   	push   %rbx
    4d22:	48 83 ec 28          	sub    $0x28,%rsp
    4d26:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4d2a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4d2e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4d32:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4d36:	48 89 c7             	mov    %rax,%rdi
    4d39:	e8 79 00 00 00       	callq  4db7 <_ZSt12__miter_baseIPiEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E>
    4d3e:	48 89 c3             	mov    %rax,%rbx
    4d41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4d45:	48 89 c7             	mov    %rax,%rdi
    4d48:	e8 6a 00 00 00       	callq  4db7 <_ZSt12__miter_baseIPiEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E>
    4d4d:	48 89 c1             	mov    %rax,%rcx
    4d50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4d54:	48 89 c2             	mov    %rax,%rdx
    4d57:	48 89 de             	mov    %rbx,%rsi
    4d5a:	48 89 cf             	mov    %rcx,%rdi
    4d5d:	e8 7b 00 00 00       	callq  4ddd <_ZSt14__copy_move_a2ILb1EPiS0_ET1_T0_S2_S1_>
    4d62:	48 83 c4 28          	add    $0x28,%rsp
    4d66:	5b                   	pop    %rbx
    4d67:	5d                   	pop    %rbp
    4d68:	c3                   	retq   

0000000000004d69 <_ZSt6fill_nIPimiET_S1_T0_RKT1_>:
    4d69:	f3 0f 1e fa          	endbr64 
    4d6d:	55                   	push   %rbp
    4d6e:	48 89 e5             	mov    %rsp,%rbp
    4d71:	48 83 ec 20          	sub    $0x20,%rsp
    4d75:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4d79:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4d7d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    4d81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4d85:	48 89 c7             	mov    %rax,%rdi
    4d88:	e8 b1 fe ff ff       	callq  4c3e <_ZSt12__niter_baseIPiET_S1_>
    4d8d:	48 89 c1             	mov    %rax,%rcx
    4d90:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    4d94:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    4d98:	48 89 c6             	mov    %rax,%rsi
    4d9b:	48 89 cf             	mov    %rcx,%rdi
    4d9e:	e8 a8 00 00 00       	callq  4e4b <_ZSt10__fill_n_aIPimiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_>
    4da3:	48 89 c2             	mov    %rax,%rdx
    4da6:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
    4daa:	48 89 d6             	mov    %rdx,%rsi
    4dad:	48 89 c7             	mov    %rax,%rdi
    4db0:	e8 dd 00 00 00       	callq  4e92 <_ZSt12__niter_wrapIPiET_RKS1_S1_>
    4db5:	c9                   	leaveq 
    4db6:	c3                   	retq   

0000000000004db7 <_ZSt12__miter_baseIPiEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E>:
    4db7:	f3 0f 1e fa          	endbr64 
    4dbb:	55                   	push   %rbp
    4dbc:	48 89 e5             	mov    %rsp,%rbp
    4dbf:	48 83 ec 10          	sub    $0x10,%rsp
    4dc3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4dc7:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
    4dcb:	48 89 c7             	mov    %rax,%rdi
    4dce:	e8 d5 00 00 00       	callq  4ea8 <_ZNKSt13move_iteratorIPiE4baseEv>
    4dd3:	48 89 c7             	mov    %rax,%rdi
    4dd6:	e8 e2 00 00 00       	callq  4ebd <_ZSt12__miter_baseIPiET_S1_>
    4ddb:	c9                   	leaveq 
    4ddc:	c3                   	retq   

0000000000004ddd <_ZSt14__copy_move_a2ILb1EPiS0_ET1_T0_S2_S1_>:
    4ddd:	f3 0f 1e fa          	endbr64 
    4de1:	55                   	push   %rbp
    4de2:	48 89 e5             	mov    %rsp,%rbp
    4de5:	41 54                	push   %r12
    4de7:	53                   	push   %rbx
    4de8:	48 83 ec 20          	sub    $0x20,%rsp
    4dec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4df0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4df4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4df8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4dfc:	48 89 c7             	mov    %rax,%rdi
    4dff:	e8 3a fe ff ff       	callq  4c3e <_ZSt12__niter_baseIPiET_S1_>
    4e04:	49 89 c4             	mov    %rax,%r12
    4e07:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4e0b:	48 89 c7             	mov    %rax,%rdi
    4e0e:	e8 2b fe ff ff       	callq  4c3e <_ZSt12__niter_baseIPiET_S1_>
    4e13:	48 89 c3             	mov    %rax,%rbx
    4e16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4e1a:	48 89 c7             	mov    %rax,%rdi
    4e1d:	e8 1c fe ff ff       	callq  4c3e <_ZSt12__niter_baseIPiET_S1_>
    4e22:	4c 89 e2             	mov    %r12,%rdx
    4e25:	48 89 de             	mov    %rbx,%rsi
    4e28:	48 89 c7             	mov    %rax,%rdi
    4e2b:	e8 9f 00 00 00       	callq  4ecf <_ZSt13__copy_move_aILb1EPiS0_ET1_T0_S2_S1_>
    4e30:	48 89 c2             	mov    %rax,%rdx
    4e33:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
    4e37:	48 89 d6             	mov    %rdx,%rsi
    4e3a:	48 89 c7             	mov    %rax,%rdi
    4e3d:	e8 50 00 00 00       	callq  4e92 <_ZSt12__niter_wrapIPiET_RKS1_S1_>
    4e42:	48 83 c4 20          	add    $0x20,%rsp
    4e46:	5b                   	pop    %rbx
    4e47:	41 5c                	pop    %r12
    4e49:	5d                   	pop    %rbp
    4e4a:	c3                   	retq   

0000000000004e4b <_ZSt10__fill_n_aIPimiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_>:
    4e4b:	f3 0f 1e fa          	endbr64 
    4e4f:	55                   	push   %rbp
    4e50:	48 89 e5             	mov    %rsp,%rbp
    4e53:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4e57:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4e5b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4e5f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4e63:	8b 00                	mov    (%rax),%eax
    4e65:	89 45 f4             	mov    %eax,-0xc(%rbp)
    4e68:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4e6c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    4e70:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    4e75:	74 15                	je     4e8c <_ZSt10__fill_n_aIPimiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_+0x41>
    4e77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4e7b:	8b 55 f4             	mov    -0xc(%rbp),%edx
    4e7e:	89 10                	mov    %edx,(%rax)
    4e80:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
    4e85:	48 83 45 e8 04       	addq   $0x4,-0x18(%rbp)
    4e8a:	eb e4                	jmp    4e70 <_ZSt10__fill_n_aIPimiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_+0x25>
    4e8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4e90:	5d                   	pop    %rbp
    4e91:	c3                   	retq   

0000000000004e92 <_ZSt12__niter_wrapIPiET_RKS1_S1_>:
    4e92:	f3 0f 1e fa          	endbr64 
    4e96:	55                   	push   %rbp
    4e97:	48 89 e5             	mov    %rsp,%rbp
    4e9a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4e9e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    4ea2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    4ea6:	5d                   	pop    %rbp
    4ea7:	c3                   	retq   

0000000000004ea8 <_ZNKSt13move_iteratorIPiE4baseEv>:
    4ea8:	f3 0f 1e fa          	endbr64 
    4eac:	55                   	push   %rbp
    4ead:	48 89 e5             	mov    %rsp,%rbp
    4eb0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4eb4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4eb8:	48 8b 00             	mov    (%rax),%rax
    4ebb:	5d                   	pop    %rbp
    4ebc:	c3                   	retq   

0000000000004ebd <_ZSt12__miter_baseIPiET_S1_>:
    4ebd:	f3 0f 1e fa          	endbr64 
    4ec1:	55                   	push   %rbp
    4ec2:	48 89 e5             	mov    %rsp,%rbp
    4ec5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    4ec9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4ecd:	5d                   	pop    %rbp
    4ece:	c3                   	retq   

0000000000004ecf <_ZSt13__copy_move_aILb1EPiS0_ET1_T0_S2_S1_>:
    4ecf:	f3 0f 1e fa          	endbr64 
    4ed3:	55                   	push   %rbp
    4ed4:	48 89 e5             	mov    %rsp,%rbp
    4ed7:	48 83 ec 30          	sub    $0x30,%rsp
    4edb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4edf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4ee3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4ee7:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    4eeb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4eef:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    4ef3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4ef7:	48 89 ce             	mov    %rcx,%rsi
    4efa:	48 89 c7             	mov    %rax,%rdi
    4efd:	e8 02 00 00 00       	callq  4f04 <_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_>
    4f02:	c9                   	leaveq 
    4f03:	c3                   	retq   

0000000000004f04 <_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_>:
    4f04:	f3 0f 1e fa          	endbr64 
    4f08:	55                   	push   %rbp
    4f09:	48 89 e5             	mov    %rsp,%rbp
    4f0c:	48 83 ec 30          	sub    $0x30,%rsp
    4f10:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4f14:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    4f18:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    4f1c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4f20:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
    4f24:	48 c1 f8 02          	sar    $0x2,%rax
    4f28:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    4f2c:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    4f31:	74 1f                	je     4f52 <_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_+0x4e>
    4f33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4f37:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    4f3e:	00 
    4f3f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    4f43:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4f47:	48 89 ce             	mov    %rcx,%rsi
    4f4a:	48 89 c7             	mov    %rax,%rdi
    4f4d:	e8 be d4 ff ff       	callq  2410 <memmove@plt>
    4f52:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4f56:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    4f5d:	00 
    4f5e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4f62:	48 01 d0             	add    %rdx,%rax
    4f65:	c9                   	leaveq 
    4f66:	c3                   	retq   
    4f67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    4f6e:	00 00 

0000000000004f70 <__libc_csu_init>:
    4f70:	f3 0f 1e fa          	endbr64 
    4f74:	41 57                	push   %r15
    4f76:	4c 8d 3d 03 2d 00 00 	lea    0x2d03(%rip),%r15        # 7c80 <__frame_dummy_init_array_entry>
    4f7d:	41 56                	push   %r14
    4f7f:	49 89 d6             	mov    %rdx,%r14
    4f82:	41 55                	push   %r13
    4f84:	49 89 f5             	mov    %rsi,%r13
    4f87:	41 54                	push   %r12
    4f89:	41 89 fc             	mov    %edi,%r12d
    4f8c:	55                   	push   %rbp
    4f8d:	48 8d 2d fc 2c 00 00 	lea    0x2cfc(%rip),%rbp        # 7c90 <__init_array_end>
    4f94:	53                   	push   %rbx
    4f95:	4c 29 fd             	sub    %r15,%rbp
    4f98:	48 83 ec 08          	sub    $0x8,%rsp
    4f9c:	e8 5f d0 ff ff       	callq  2000 <_init>
    4fa1:	48 c1 fd 03          	sar    $0x3,%rbp
    4fa5:	74 1f                	je     4fc6 <__libc_csu_init+0x56>
    4fa7:	31 db                	xor    %ebx,%ebx
    4fa9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4fb0:	4c 89 f2             	mov    %r14,%rdx
    4fb3:	4c 89 ee             	mov    %r13,%rsi
    4fb6:	44 89 e7             	mov    %r12d,%edi
    4fb9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    4fbd:	48 83 c3 01          	add    $0x1,%rbx
    4fc1:	48 39 dd             	cmp    %rbx,%rbp
    4fc4:	75 ea                	jne    4fb0 <__libc_csu_init+0x40>
    4fc6:	48 83 c4 08          	add    $0x8,%rsp
    4fca:	5b                   	pop    %rbx
    4fcb:	5d                   	pop    %rbp
    4fcc:	41 5c                	pop    %r12
    4fce:	41 5d                	pop    %r13
    4fd0:	41 5e                	pop    %r14
    4fd2:	41 5f                	pop    %r15
    4fd4:	c3                   	retq   
    4fd5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    4fdc:	00 00 00 00 

0000000000004fe0 <__libc_csu_fini>:
    4fe0:	f3 0f 1e fa          	endbr64 
    4fe4:	c3                   	retq   

Disassembly of section .fini:

0000000000004fe8 <_fini>:
    4fe8:	f3 0f 1e fa          	endbr64 
    4fec:	48 83 ec 08          	sub    $0x8,%rsp
    4ff0:	48 83 c4 08          	add    $0x8,%rsp
    4ff4:	c3                   	retq   
