.class public Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;
.super Ljava/lang/Object;
.source "SystemDefaultCredentialsProvider.java"

# interfaces
.implements Lorg/apache/http/client/CredentialsProvider;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field private static final SCHEME_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final internal:Lorg/apache/http/impl/client/BasicCredentialsProvider;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 55
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    .line 56
    sget-object v0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "Basic"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Basic"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "Digest"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Digest"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "NTLM"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "NTLM"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "negotiate"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SPNEGO"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "Kerberos"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Kerberos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Lorg/apache/http/impl/client/BasicCredentialsProvider;

    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicCredentialsProvider;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->internal:Lorg/apache/http/impl/client/BasicCredentialsProvider;

    .line 79
    return-void
.end method

.method private static translateScheme(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 64
    if-nez p0, :cond_4

    .line 65
    const/4 v0, 0x0

    .line 68
    :cond_3
    :goto_3
    return-object v0

    .line 67
    :cond_4
    sget-object v1, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 68
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_3

    move-object v0, p0

    goto :goto_3
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->internal:Lorg/apache/http/impl/client/BasicCredentialsProvider;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/BasicCredentialsProvider;->clear()V

    .line 109
    return-void
.end method

.method public getCredentials(Lorg/apache/http/auth/AuthScope;)Lorg/apache/http/auth/Credentials;
    .registers 10
    .param p1, "authscope"    # Lorg/apache/http/auth/AuthScope;

    .prologue
    const/4 v1, 0x0

    .line 86
    const-string v0, "Auth scope"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 87
    iget-object v0, p0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->internal:Lorg/apache/http/impl/client/BasicCredentialsProvider;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/client/BasicCredentialsProvider;->getCredentials(Lorg/apache/http/auth/AuthScope;)Lorg/apache/http/auth/Credentials;

    move-result-object v6

    .line 88
    .local v6, "localcreds":Lorg/apache/http/auth/Credentials;
    if-eqz v6, :cond_f

    .line 104
    .end local v6    # "localcreds":Lorg/apache/http/auth/Credentials;
    :goto_e
    return-object v6

    .line 91
    .restart local v6    # "localcreds":Lorg/apache/http/auth/Credentials;
    :cond_f
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_41

    .line 92
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getPort()I

    move-result v2

    const-string v3, "http"

    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->translateScheme(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v4, v1

    invoke-static/range {v0 .. v5}, Ljava/net/Authenticator;->requestPasswordAuthentication(Ljava/lang/String;Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/PasswordAuthentication;

    move-result-object v7

    .line 99
    .local v7, "systemcreds":Ljava/net/PasswordAuthentication;
    if-eqz v7, :cond_41

    .line 100
    new-instance v6, Lorg/apache/http/auth/UsernamePasswordCredentials;

    .end local v6    # "localcreds":Lorg/apache/http/auth/Credentials;
    invoke-virtual {v7}, Ljava/net/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/net/PasswordAuthentication;->getPassword()[C

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v6, v0, v1}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    .end local v7    # "systemcreds":Ljava/net/PasswordAuthentication;
    .restart local v6    # "localcreds":Lorg/apache/http/auth/Credentials;
    :cond_41
    move-object v6, v1

    .line 104
    goto :goto_e
.end method

.method public setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V
    .registers 4
    .param p1, "authscope"    # Lorg/apache/http/auth/AuthScope;
    .param p2, "credentials"    # Lorg/apache/http/auth/Credentials;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;->internal:Lorg/apache/http/impl/client/BasicCredentialsProvider;

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/client/BasicCredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 83
    return-void
.end method
