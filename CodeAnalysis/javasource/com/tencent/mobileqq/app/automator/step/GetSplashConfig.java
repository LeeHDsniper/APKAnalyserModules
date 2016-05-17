package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.activity.StructMsgObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.config.splashlogo.ConfigServlet;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.portal.PortalManager;
import com.tencent.mobileqq.portal.RedPacketServlet;

public class GetSplashConfig
  extends AsyncStep
{
  public GetSplashConfig()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    a.b.b(a.b.a());
    ConfigServlet.h(a.b, a.b.a());
    ConfigServlet.i(a.b, a.b.a());
    ConfigServlet.a(a.b);
    ConfigServlet.b(a.b);
    ConfigServlet.s(a.b, a.b.a());
    ConfigServlet.j(a.b, a.b.a());
    ConfigServlet.r(a.b, a.b.a());
    ConfigServlet.q(a.b, a.b.a());
    ConfigServlet.g(a.b, a.b.a());
    ConfigServlet.b(a.b, a.b.a());
    ConfigServlet.k(a.b, a.b.a());
    ConfigServlet.l(a.b, a.b.a());
    ConfigServlet.c(a.b, a.b.a());
    ConfigServlet.d(a.b, a.b.a());
    ConfigServlet.e(a.b, a.b.a());
    ConfigServlet.f(a.b, a.b.a());
    ConfigServlet.t(a.b, a.b.a());
    ConfigServlet.u(a.b, a.b.a());
    ConfigServlet.D(a.b, a.b.a());
    ConfigServlet.H(a.b, a.b.a());
    ConfigServlet.E(a.b, a.b.a());
    ConfigServlet.v(a.b, a.b.a());
    ConfigServlet.w(a.b, a.b.a());
    ConfigServlet.y(a.b, a.b.a());
    ConfigServlet.m(a.b, a.b.a());
    ConfigServlet.J(a.b, a.b.a());
    ConfigServlet.n(a.b, a.b.a());
    ConfigServlet.p(a.b, a.b.a());
    ConfigServlet.a(a.b, a.b.a(), -1);
    ConfigServlet.z(a.b, a.b.a());
    ConfigServlet.L(a.b, a.b.a());
    ConfigServlet.K(a.b, a.b.a());
    ConfigServlet.x(a.b, a.b.a());
    ConfigServlet.A(a.b, a.b.a());
    ConfigServlet.B(a.b, a.b.a());
    ConfigServlet.C(a.b, a.b.a());
    ConfigServlet.o(a.b, a.b.a());
    ConfigServlet.F(a.b, a.b.a());
    ConfigServlet.G(a.b, a.b.a());
    ConfigServlet.a(a.b, a.b.a());
    PortalManager localPortalManager = (PortalManager)a.b.getManager(78);
    RedPacketServlet.a(a.b, localPortalManager.c());
    a.b.a().addObserver(new StructMsgObserver());
    return 7;
  }
}
