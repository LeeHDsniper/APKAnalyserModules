.class public final Lcom/squareup/okhttp/ConnectionSpec$Builder;
.super Ljava/lang/Object;
.source "ConnectionSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/ConnectionSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private cipherSuites:[Ljava/lang/String;

.field private supportsTlsExtensions:Z

.field private tls:Z

.field private tlsVersions:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/ConnectionSpec;)V
    .registers 3
    .param p1, "connectionSpec"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    iget-boolean v0, p1, Lcom/squareup/okhttp/ConnectionSpec;->tls:Z

    iput-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tls:Z

    .line 191
    # getter for: Lcom/squareup/okhttp/ConnectionSpec;->cipherSuites:[Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec;->access$500(Lcom/squareup/okhttp/ConnectionSpec;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    .line 192
    # getter for: Lcom/squareup/okhttp/ConnectionSpec;->tlsVersions:[Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/ConnectionSpec;->access$600(Lcom/squareup/okhttp/ConnectionSpec;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    .line 193
    iget-boolean v0, p1, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions:Z

    iput-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    .line 194
    return-void
.end method

.method private constructor <init>(Z)V
    .registers 2
    .param p1, "tls"    # Z

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    iput-boolean p1, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tls:Z

    .line 187
    return-void
.end method

.method synthetic constructor <init>(ZLcom/squareup/okhttp/ConnectionSpec$1;)V
    .registers 3
    .param p1, "x0"    # Z
    .param p2, "x1"    # Lcom/squareup/okhttp/ConnectionSpec$1;

    .prologue
    .line 179
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;-><init>(Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/ConnectionSpec$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec$Builder;

    .prologue
    .line 179
    iget-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tls:Z

    return v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/ConnectionSpec$Builder;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec$Builder;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/ConnectionSpec$Builder;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec$Builder;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/ConnectionSpec$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionSpec$Builder;

    .prologue
    .line 179
    iget-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    return v0
.end method


# virtual methods
.method public build()Lcom/squareup/okhttp/ConnectionSpec;
    .registers 3

    .prologue
    .line 237
    new-instance v0, Lcom/squareup/okhttp/ConnectionSpec;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/ConnectionSpec;-><init>(Lcom/squareup/okhttp/ConnectionSpec$Builder;Lcom/squareup/okhttp/ConnectionSpec$1;)V

    return-object v0
.end method

.method public varargs cipherSuites([Lcom/squareup/okhttp/CipherSuite;)Lcom/squareup/okhttp/ConnectionSpec$Builder;
    .registers 6
    .param p1, "cipherSuites"    # [Lcom/squareup/okhttp/CipherSuite;

    .prologue
    .line 197
    iget-boolean v2, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tls:Z

    if-nez v2, :cond_c

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "no cipher suites for cleartext connections"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 200
    :cond_c
    array-length v2, p1

    new-array v1, v2, [Ljava/lang/String;

    .line 201
    .local v1, "strings":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v2, p1

    if-ge v0, v2, :cond_1c

    .line 202
    aget-object v2, p1, v0

    iget-object v2, v2, Lcom/squareup/okhttp/CipherSuite;->javaName:Ljava/lang/String;

    aput-object v2, v1, v0

    .line 201
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 205
    :cond_1c
    invoke-virtual {p0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites([Ljava/lang/String;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v2

    return-object v2
.end method

.method cipherSuites([Ljava/lang/String;)Lcom/squareup/okhttp/ConnectionSpec$Builder;
    .registers 2
    .param p1, "cipherSuites"    # [Ljava/lang/String;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    .line 210
    return-object p0
.end method

.method public supportsTlsExtensions(Z)Lcom/squareup/okhttp/ConnectionSpec$Builder;
    .registers 4
    .param p1, "supportsTlsExtensions"    # Z

    .prologue
    .line 231
    iget-boolean v0, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tls:Z

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no TLS extensions for cleartext connections"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 232
    :cond_c
    iput-boolean p1, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    .line 233
    return-object p0
.end method

.method public varargs tlsVersions([Lcom/squareup/okhttp/TlsVersion;)Lcom/squareup/okhttp/ConnectionSpec$Builder;
    .registers 6
    .param p1, "tlsVersions"    # [Lcom/squareup/okhttp/TlsVersion;

    .prologue
    .line 214
    iget-boolean v2, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tls:Z

    if-nez v2, :cond_c

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "no TLS versions for cleartext connections"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 217
    :cond_c
    array-length v2, p1

    new-array v1, v2, [Ljava/lang/String;

    .line 218
    .local v1, "strings":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v2, p1

    if-ge v0, v2, :cond_1c

    .line 219
    aget-object v2, p1, v0

    iget-object v2, v2, Lcom/squareup/okhttp/TlsVersion;->javaName:Ljava/lang/String;

    aput-object v2, v1, v0

    .line 218
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 222
    :cond_1c
    invoke-virtual {p0, v1}, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions([Ljava/lang/String;)Lcom/squareup/okhttp/ConnectionSpec$Builder;

    move-result-object v2

    return-object v2
.end method

.method varargs tlsVersions([Ljava/lang/String;)Lcom/squareup/okhttp/ConnectionSpec$Builder;
    .registers 2
    .param p1, "tlsVersions"    # [Ljava/lang/String;

    .prologue
    .line 226
    iput-object p1, p0, Lcom/squareup/okhttp/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    .line 227
    return-object p0
.end method
