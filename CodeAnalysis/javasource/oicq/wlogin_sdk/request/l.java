package oicq.wlogin_sdk.request;

import java.util.ArrayList;
import java.util.List;
import oicq.wlogin_sdk.sharemem.WloginSigInfo;
import oicq.wlogin_sdk.tlv_type.ab;
import oicq.wlogin_sdk.tlv_type.af;
import oicq.wlogin_sdk.tlv_type.ak;
import oicq.wlogin_sdk.tlv_type.al;
import oicq.wlogin_sdk.tlv_type.an;
import oicq.wlogin_sdk.tlv_type.ao;
import oicq.wlogin_sdk.tlv_type.aq;
import oicq.wlogin_sdk.tlv_type.av;
import oicq.wlogin_sdk.tlv_type.az;
import oicq.wlogin_sdk.tlv_type.b;
import oicq.wlogin_sdk.tlv_type.bc;
import oicq.wlogin_sdk.tlv_type.be;
import oicq.wlogin_sdk.tlv_type.bg;
import oicq.wlogin_sdk.tlv_type.bj;
import oicq.wlogin_sdk.tlv_type.br;
import oicq.wlogin_sdk.tlv_type.bv;
import oicq.wlogin_sdk.tlv_type.bx;
import oicq.wlogin_sdk.tlv_type.by;
import oicq.wlogin_sdk.tlv_type.bz;
import oicq.wlogin_sdk.tlv_type.c;
import oicq.wlogin_sdk.tlv_type.cc;
import oicq.wlogin_sdk.tlv_type.ch;
import oicq.wlogin_sdk.tlv_type.ci;
import oicq.wlogin_sdk.tlv_type.ck;
import oicq.wlogin_sdk.tlv_type.cp;
import oicq.wlogin_sdk.tlv_type.cq;
import oicq.wlogin_sdk.tlv_type.f;
import oicq.wlogin_sdk.tlv_type.h;
import oicq.wlogin_sdk.tlv_type.i;
import oicq.wlogin_sdk.tlv_type.j;
import oicq.wlogin_sdk.tlv_type.q;
import oicq.wlogin_sdk.tlv_type.t;
import oicq.wlogin_sdk.tools.util;

public class l
  extends k
{
  public static boolean D = false;
  public static byte[] E = new byte[0];
  public static byte[] F = new byte[0];
  public static byte[] G = new byte[0];
  
  public l(u paramU)
  {
    s = 2064;
    t = 9;
    u = "wtlogin.login";
    w = paramU;
    w.m = 0;
  }
  
  public int a(long paramLong1, long paramLong2, long paramLong3, int paramInt1, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, int paramInt2, int paramInt3, int paramInt4, long[] paramArrayOfLong, int paramInt5, long paramLong4, int paramInt6, int paramInt7, int paramInt8, int paramInt9, byte[] paramArrayOfByte4, WUserSigInfo paramWUserSigInfo)
  {
    int j = u.u;
    Object localObject = u.b(w.h);
    _tgtgt_key = util.get_rand_16byte(u.z);
    byte[] arrayOfByte1 = _tgtgt_key;
    localObject = _t104;
    if (localObject == null) {
      localObject = new f();
    }
    for (;;)
    {
      int i = 0;
      for (;;)
      {
        byte[] arrayOfByte2 = a(paramLong1, paramLong2, j, paramLong3, paramInt1, paramArrayOfByte1, paramArrayOfByte2, paramArrayOfByte3, arrayOfByte1, paramInt2, null, null, paramInt3, paramInt4, paramArrayOfLong, paramInt5, paramLong4, paramInt6, paramInt7, paramInt8, paramInt9, paramArrayOfByte4, ((f)localObject).b(), u.C, _domains);
        a(h, s, this.i, paramLong3, l, m, j, o, arrayOfByte2);
        int k = a(String.valueOf(w.f), false, paramWUserSigInfo);
        if (k != 0) {
          return k;
        }
        k = b();
        util.LOGI("retry num:" + i + " ret:" + k, "" + paramLong3);
        if (k != 180) {
          return k;
        }
        if (i >= 1) {
          return k;
        }
        i += 1;
      }
    }
  }
  
  public int a(long paramLong1, long paramLong2, long paramLong3, int paramInt1, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, int paramInt2, int paramInt3, long[] paramArrayOfLong, int paramInt4, long paramLong4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, byte[] paramArrayOfByte4, WUserSigInfo paramWUserSigInfo)
  {
    int m = u.u;
    f localF = bw.h)._t104;
    if (localF == null) {
      localF = new f();
    }
    for (;;)
    {
      paramArrayOfByte2 = c(paramArrayOfByte2);
      int j;
      if (paramArrayOfByte2 == null)
      {
        j = 64522;
        return j;
      }
      int i = 0;
      for (;;)
      {
        byte[] arrayOfByte = a(paramLong1, paramLong2, m, paramLong3, paramInt1, paramArrayOfByte1, null, null, null, 0, paramArrayOfByte2, paramArrayOfByte3, paramInt2, paramInt3, paramArrayOfLong, paramInt4, paramLong4, paramInt5, paramInt6, paramInt7, paramInt8, paramArrayOfByte4, localF.b(), u.C, _domains);
        a(h, s, this.i, paramLong3, l, this.m, m, o, arrayOfByte);
        int k = a(String.valueOf(w.f), false, paramWUserSigInfo);
        j = k;
        if (k != 0) {
          break;
        }
        j = b();
        util.LOGI("retry num:" + i + " ret:" + j, "" + paramLong3);
        if (j != 180) {
          return j;
        }
        if (i >= 1) {
          return j;
        }
        i += 1;
      }
    }
  }
  
  public byte[] a(long paramLong1, long paramLong2, int paramInt1, long paramLong3, int paramInt2, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, int paramInt3, byte[] paramArrayOfByte5, byte[] paramArrayOfByte6, int paramInt4, int paramInt5, long[] paramArrayOfLong, int paramInt6, long paramLong4, int paramInt7, int paramInt8, int paramInt9, int paramInt10, byte[] paramArrayOfByte7, byte[] paramArrayOfByte8, byte[] paramArrayOfByte9, List<String> paramList)
  {
    int[] arrayOfInt = new int[29];
    int[] tmp8_6 = arrayOfInt;
    tmp8_6[0] = 24;
    int[] tmp13_8 = tmp8_6;
    tmp13_8[1] = 1;
    int[] tmp17_13 = tmp13_8;
    tmp17_13[2] = 'Ć';
    int[] tmp23_17 = tmp17_13;
    tmp23_17[3] = 'Ė';
    int[] tmp29_23 = tmp23_17;
    tmp29_23[4] = 'Ā';
    int[] tmp35_29 = tmp29_23;
    tmp35_29[5] = 'ć';
    int[] tmp41_35 = tmp35_29;
    tmp41_35[6] = 'Ĉ';
    int[] tmp48_41 = tmp41_35;
    tmp48_41[7] = 'Ą';
    int[] tmp55_48 = tmp48_41;
    tmp55_48[8] = 'ł';
    int[] tmp62_55 = tmp55_48;
    tmp62_55[9] = 'Ē';
    int[] tmp69_62 = tmp62_55;
    tmp69_62[10] = 'ń';
    int[] tmp76_69 = tmp69_62;
    tmp76_69[11] = 'Ņ';
    int[] tmp83_76 = tmp76_69;
    tmp83_76[12] = 'Ň';
    int[] tmp90_83 = tmp83_76;
    tmp90_83[13] = 'Ŧ';
    int[] tmp97_90 = tmp90_83;
    tmp97_90[14] = 'Ū';
    int[] tmp104_97 = tmp97_90;
    tmp104_97[15] = 'Ŕ';
    int[] tmp111_104 = tmp104_97;
    tmp111_104[16] = 'Ł';
    int[] tmp118_111 = tmp111_104;
    tmp118_111[17] = 8;
    int[] tmp124_118 = tmp118_111;
    tmp124_118[18] = 'ԑ';
    int[] tmp131_124 = tmp124_118;
    tmp131_124[19] = 'Ų';
    int[] tmp138_131 = tmp131_124;
    tmp138_131[20] = 'ƅ';
    int[] tmp145_138 = tmp138_131;
    tmp145_138[21] = 'Ѐ';
    int[] tmp152_145 = tmp145_138;
    tmp152_145[22] = 'Ƈ';
    int[] tmp159_152 = tmp152_145;
    tmp159_152[23] = 'ƈ';
    int[] tmp166_159 = tmp159_152;
    tmp166_159[24] = 'Ɣ';
    int[] tmp173_166 = tmp166_159;
    tmp173_166[25] = 'Ƒ';
    int[] tmp180_173 = tmp173_166;
    tmp180_173[26] = 'ȁ';
    int[] tmp187_180 = tmp180_173;
    tmp187_180[27] = 'Ȃ';
    int[] tmp194_187 = tmp187_180;
    tmp194_187[28] = 'ŷ';
    tmp194_187;
    async_context localAsync_context = u.b(w.h);
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    int k = arrayOfInt.length;
    int j = 0;
    int m;
    Object localObject2;
    Object localObject1;
    if (j < k)
    {
      m = arrayOfInt[j];
      localObject2 = null;
      switch (m)
      {
      default: 
        localObject1 = localObject2;
        label500:
        if (localObject1 != null)
        {
          localArrayList.add(localObject1);
          i = localObject1.length + i;
        }
        break;
      }
    }
    for (;;)
    {
      j += 1;
      break;
      localObject1 = new br().a(paramLong1, paramInt1, paramLong3, paramInt2);
      break label500;
      localObject1 = new b().a(paramLong3, paramArrayOfByte1);
      break label500;
      localObject1 = new h();
      if ((paramArrayOfByte5 != null) && (paramArrayOfByte5.length > 0))
      {
        ((h)localObject1).a(paramArrayOfByte5, paramArrayOfByte5.length);
        localObject1 = ((h)localObject1).a();
        break label500;
      }
      localObject1 = ((h)localObject1).a(paramLong1, paramLong2, paramInt1, paramLong3, paramArrayOfByte2, paramArrayOfByte1, 1, paramArrayOfByte3, _msalt, w.g.getBytes(), paramArrayOfByte4, u.S, u.y, paramInt3);
      break label500;
      localObject1 = new t().a(paramInt4, paramInt5, paramArrayOfLong);
      break label500;
      localObject1 = new c().a(paramLong1, paramLong4, paramInt1, paramInt6);
      break label500;
      localObject1 = new i().a(paramInt7, paramInt8, paramInt9, paramInt10);
      break label500;
      localObject1 = localObject2;
      if (paramArrayOfByte7 == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (paramArrayOfByte7.length == 0) {
        break label500;
      }
      localObject1 = new j().a(paramArrayOfByte7);
      break label500;
      localObject1 = localObject2;
      if (paramArrayOfByte8 == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (paramArrayOfByte8.length == 0) {
        break label500;
      }
      localObject1 = new f().a(paramArrayOfByte8);
      break label500;
      localObject1 = new al().a(paramArrayOfByte9);
      break label500;
      localObject1 = localObject2;
      if (w.g == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (util.check_uin_account(w.g).booleanValue()) {
        break label500;
      }
      localObject1 = new q().a(w.g.getBytes());
      break label500;
      localObject1 = new oicq.wlogin_sdk.tlv_type.k().a(u.K);
      localObject2 = new ab();
      Object localObject3 = util.get_os_type();
      byte[] arrayOfByte1 = util.get_os_version();
      m = u.B;
      byte[] arrayOfByte2 = u.A;
      byte[] arrayOfByte3 = u.D;
      localObject2 = ((ab)localObject2).a((byte[])localObject3, arrayOfByte1, m, arrayOfByte2, new byte[0], arrayOfByte3);
      localObject3 = new af().a(u.R, u.S, u.T, u.W, u.G, u.y, u.N);
      arrayOfByte1 = new be().a(u.G);
      localObject1 = new an().a((byte[])localObject1, (byte[])localObject2, (byte[])localObject3, arrayOfByte1, _tgtgt_key);
      break label500;
      localObject1 = new ao().a(u.y);
      break label500;
      localObject1 = new aq().a(paramLong1, u.E, u.F);
      break label500;
      localObject1 = localObject2;
      if ((paramInt4 & 0x80) == 0) {
        break label500;
      }
      localObject1 = new az().b(u.v);
      break label500;
      localObject1 = localObject2;
      if (paramArrayOfByte6 == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (paramArrayOfByte6.length == 0) {
        break label500;
      }
      localObject1 = new bc().a(paramArrayOfByte6);
      break label500;
      localObject1 = new av().b(w.i);
      break label500;
      localObject1 = new ak().b(u.A, u.B, u.D);
      break label500;
      localObject1 = new cq().a(0, u.s, 0);
      break label500;
      localObject1 = localObject2;
      if (paramList == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (paramList.size() == 0) {
        break label500;
      }
      localObject1 = new cp().a(paramList);
      break label500;
      localObject1 = localObject2;
      if (w.p == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (w.p.length == 0) {
        break label500;
      }
      localObject1 = new bg().a(w.p);
      break label500;
      localObject1 = localObject2;
      if (paramInt3 != 3) {
        break label500;
      }
      localObject1 = new bv().b(1);
      break label500;
      localObject3 = w.a(paramLong3, paramLong1);
      localObject1 = localObject2;
      if (localObject3 == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (_G == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (_G.length == 0) {
        break label500;
      }
      localObject1 = localObject2;
      if (_dpwd == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (_dpwd.length == 0) {
        break label500;
      }
      localObject1 = localObject2;
      if (_randseed == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (_randseed.length == 0) {
        break label500;
      }
      localObject1 = new ck().a(_G, paramLong3, u.y, _dpwd, paramLong1, paramLong2, _randseed);
      break label500;
      localObject1 = localObject2;
      if (u.L == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (u.L.length == 0) {
        break label500;
      }
      localObject1 = new bx().a(u.L);
      break label500;
      localObject1 = localObject2;
      if (u.M == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (u.M.length == 0) {
        break label500;
      }
      localObject1 = new by().a(u.M);
      break label500;
      localObject1 = localObject2;
      if (u.J == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (u.J.length == 0) {
        break label500;
      }
      localObject1 = new cc().a(u.J);
      break label500;
      localObject1 = new bz().a(D);
      break label500;
      localObject1 = localObject2;
      if (E == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (E.length == 0) {
        break label500;
      }
      localObject1 = new ch().a(E, F, "qq".getBytes(), G);
      break label500;
      localObject1 = localObject2;
      if (u.P == null) {
        break label500;
      }
      localObject1 = localObject2;
      if (u.P.length == 0) {
        break label500;
      }
      localObject1 = new ci().a(u.P, u.Q);
      break label500;
      localObject1 = new bj().a(1460696337L, "6.3.1.1521");
      break label500;
      paramArrayOfByte1 = new byte[i];
      paramInt3 = localArrayList.size();
      paramInt2 = 0;
      paramInt1 = 0;
      while (paramInt1 < paramInt3)
      {
        paramArrayOfByte2 = (byte[])localArrayList.get(paramInt1);
        System.arraycopy(paramArrayOfByte2, 0, paramArrayOfByte1, paramInt2, paramArrayOfByte2.length);
        paramInt2 += paramArrayOfByte2.length;
        paramInt1 += 1;
      }
      return a(paramArrayOfByte1, t, paramInt3);
    }
  }
}
