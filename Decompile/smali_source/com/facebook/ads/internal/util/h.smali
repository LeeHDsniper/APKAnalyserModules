.class public Lcom/facebook/ads/internal/util/h;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    sput-object v0, Lcom/facebook/ads/internal/util/h;->a:Ljava/lang/String;

    return-void
.end method

.method public static a()Ljava/lang/String;
    .registers 4

    invoke-static {}, Lcom/facebook/ads/AdSettings;->getUrlPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    const-string v0, "https://www.facebook.com/"

    :goto_c
    return-object v0

    :cond_d
    const-string v1, "https://www.%s.facebook.com"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    invoke-static {p0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Landroid/content/Context;Lcom/facebook/ads/internal/e;)Ljava/lang/String;
    .registers 4

    sget-object v0, Lcom/facebook/ads/internal/e;->k:Lcom/facebook/ads/internal/e;

    if-eq p1, v0, :cond_a

    sget-object v0, Lcom/facebook/ads/internal/e;->j:Lcom/facebook/ads/internal/e;

    if-eq p1, v0, :cond_a

    if-nez p1, :cond_11

    :cond_a
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_10
    return-object v0

    :cond_11
    sget-object v0, Lcom/facebook/ads/internal/util/h;->a:Ljava/lang/String;

    if-nez v0, :cond_2f

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_25

    :try_start_1b
    invoke-static {p0}, Lcom/facebook/ads/internal/util/h;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/util/h;->a:Ljava/lang/String;

    sget-object v0, Lcom/facebook/ads/internal/util/h;->a:Ljava/lang/String;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_23} :catch_24

    goto :goto_10

    :catch_24
    move-exception v0

    :cond_25
    :try_start_25
    const-string v0, "android.webkit.WebSettings"

    const-string v1, "android.webkit.WebView"

    invoke-static {p0, v0, v1}, Lcom/facebook/ads/internal/util/h;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/util/h;->a:Ljava/lang/String;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_2f} :catch_32

    :cond_2f
    :goto_2f
    sget-object v0, Lcom/facebook/ads/internal/util/h;->a:Ljava/lang/String;

    goto :goto_10

    :catch_32
    move-exception v0

    :try_start_33
    const-string v0, "android.webkit.WebSettingsClassic"

    const-string v1, "android.webkit.WebViewClassic"

    invoke-static {p0, v0, v1}, Lcom/facebook/ads/internal/util/h;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/util/h;->a:Ljava/lang/String;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_3d} :catch_3e

    goto :goto_2f

    :catch_3e
    move-exception v0

    new-instance v0, Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/facebook/ads/internal/util/h;->a:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    goto :goto_2f
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    const/4 v1, 0x2

    const/4 v3, 0x1

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Landroid/content/Context;

    aput-object v2, v1, v5

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    const-string v2, "getUserAgentString"

    new-array v3, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v2, 0x2

    :try_start_23
    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    const/4 v4, 0x0

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_39
    .catchall {:try_start_23 .. :try_end_39} :catchall_3d

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    return-object v0

    :catchall_3d
    move-exception v0

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    throw v0
.end method

.method public static a(Landroid/webkit/WebView;)V
    .registers 4

    const-string v0, "about:blank"

    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->clearCache(Z)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-le v0, v1, :cond_13

    invoke-virtual {p0}, Landroid/webkit/WebView;->onPause()V

    :goto_12
    return-void

    :cond_13
    :try_start_13
    const-class v0, Landroid/webkit/WebView;

    const-string v1, "onPause"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_24} :catch_25

    goto :goto_12

    :catch_25
    move-exception v0

    goto :goto_12
.end method

.method public static b(Landroid/webkit/WebView;)V
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_f

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    :goto_e
    return-void

    :cond_f
    :try_start_f
    const-class v1, Landroid/webkit/WebSettings;

    const-string v2, "setMixedContentMode"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_28} :catch_29

    goto :goto_e

    :catch_29
    move-exception v0

    goto :goto_e
.end method
