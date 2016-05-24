.class Lcom/google/android/gms/tagmanager/zzcx;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzac;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzcx$zza;
    }
.end annotation


# instance fields
.field private final zzaRY:Landroid/content/Context;

.field private final zzaSp:Ljava/lang/String;

.field private final zzaSq:Lorg/apache/http/client/HttpClient;

.field private zzaSr:Lcom/google/android/gms/tagmanager/zzcx$zza;


# direct methods
.method constructor <init>(Lorg/apache/http/client/HttpClient;Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzcx$zza;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaRY:Landroid/content/Context;

    const-string v1, "GoogleTagManager"

    const-string v2, "4.00"

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzcx;->zzc(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v6, Landroid/os/Build;->ID:Ljava/lang/String;

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/zzcx;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSp:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSq:Lorg/apache/http/client/HttpClient;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSr:Lcom/google/android/gms/tagmanager/zzcx$zza;

    return-void
.end method

.method private zza(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    .registers 8

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v2

    array-length v3, v2

    const/4 v0, 0x0

    :goto_b
    if-ge v0, v3, :cond_1f

    aget-object v4, v2, v0

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_1f
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    if-eqz v0, :cond_5e

    :try_start_36
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_5e

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v2

    if-lez v2, :cond_5e

    new-array v2, v2, [B

    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    const-string v0, "POST:\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_5e} :catch_66

    :cond_5e
    :goto_5e
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    return-void

    :catch_66
    move-exception v0

    const-string v0, "Error Writing hit to log..."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    goto :goto_5e
.end method

.method static zzc(Ljava/util/Locale;)Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_4

    :cond_3
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_45

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_45

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method private zzd(Ljava/net/URL;)Lorg/apache/http/HttpEntityEnclosingRequest;
    .registers 7

    const/4 v1, 0x0

    :try_start_1
    new-instance v0, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;

    const-string v2, "GET"

    invoke-virtual {p1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_10
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_10} :catch_18

    :try_start_10
    const-string v1, "User-Agent"

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSp:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lorg/apache/http/HttpEntityEnclosingRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_17
    .catch Ljava/net/URISyntaxException; {:try_start_10 .. :try_end_17} :catch_42

    :goto_17
    return-object v0

    :catch_18
    move-exception v0

    move-object v4, v0

    move-object v0, v1

    move-object v1, v4

    :goto_1c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception sending hit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_17

    :catch_42
    move-exception v1

    goto :goto_1c
.end method


# virtual methods
.method zza(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    const-string v0, "%s/%s (Linux; U; Android %s; %s; %s Build/%s)"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    const/4 v2, 0x3

    aput-object p4, v1, v2

    const/4 v2, 0x4

    aput-object p5, v1, v2

    const/4 v2, 0x5

    aput-object p6, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method zzd(Lcom/google/android/gms/tagmanager/zzaq;)Ljava/net/URL;
    .registers 4

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaq;->zzAg()Ljava/lang/String;

    move-result-object v1

    :try_start_4
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_9} :catch_a

    :goto_9
    return-object v0

    :catch_a
    move-exception v0

    const-string v0, "Error trying to parse the GTM url."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_9
.end method

.method public zzr(Ljava/util/List;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/tagmanager/zzaq;",
            ">;)V"
        }
    .end annotation

    const/4 v3, 0x0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x28

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/4 v1, 0x1

    move v4, v3

    :goto_d
    if-ge v4, v5, :cond_df

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/zzaq;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tagmanager/zzcx;->zzd(Lcom/google/android/gms/tagmanager/zzaq;)Ljava/net/URL;

    move-result-object v2

    if-nez v2, :cond_2b

    const-string v2, "No destination: discarding hit."

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSr:Lcom/google/android/gms/tagmanager/zzcx$zza;

    invoke-interface {v2, v0}, Lcom/google/android/gms/tagmanager/zzcx$zza;->zzb(Lcom/google/android/gms/tagmanager/zzaq;)V

    move v0, v1

    :goto_26
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    move v1, v0

    goto :goto_d

    :cond_2b
    invoke-direct {p0, v2}, Lcom/google/android/gms/tagmanager/zzcx;->zzd(Ljava/net/URL;)Lorg/apache/http/HttpEntityEnclosingRequest;

    move-result-object v6

    if-nez v6, :cond_38

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSr:Lcom/google/android/gms/tagmanager/zzcx$zza;

    invoke-interface {v2, v0}, Lcom/google/android/gms/tagmanager/zzcx$zza;->zzb(Lcom/google/android/gms/tagmanager/zzaq;)V

    move v0, v1

    goto :goto_26

    :cond_38
    new-instance v7, Lorg/apache/http/HttpHost;

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2}, Ljava/net/URL;->getPort()I

    move-result v9

    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v8, v9, v2}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    const-string v2, "Host"

    invoke-virtual {v7}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v2, v8}, Lorg/apache/http/HttpEntityEnclosingRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v6}, Lcom/google/android/gms/tagmanager/zzcx;->zza(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    if-eqz v1, :cond_5d

    :try_start_57
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaRY:Landroid/content/Context;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbl;->zzaQ(Landroid/content/Context;)V

    move v1, v3

    :cond_5d
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSq:Lorg/apache/http/client/HttpClient;

    invoke-interface {v2, v7, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    if-eqz v7, :cond_74

    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->consumeContent()V

    :cond_74
    const/16 v7, 0xc8

    if-eq v6, v7, :cond_9d

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Bad response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSr:Lcom/google/android/gms/tagmanager/zzcx$zza;

    invoke-interface {v2, v0}, Lcom/google/android/gms/tagmanager/zzcx$zza;->zzc(Lcom/google/android/gms/tagmanager/zzaq;)V

    :goto_9b
    move v0, v1

    goto :goto_26

    :cond_9d
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSr:Lcom/google/android/gms/tagmanager/zzcx$zza;

    invoke-interface {v2, v0}, Lcom/google/android/gms/tagmanager/zzcx$zza;->zza(Lcom/google/android/gms/tagmanager/zzaq;)V
    :try_end_a2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_57 .. :try_end_a2} :catch_a3
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_a2} :catch_b1

    goto :goto_9b

    :catch_a3
    move-exception v2

    const-string v2, "ClientProtocolException sending hit; discarding hit..."

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSr:Lcom/google/android/gms/tagmanager/zzcx$zza;

    invoke-interface {v2, v0}, Lcom/google/android/gms/tagmanager/zzcx$zza;->zzb(Lcom/google/android/gms/tagmanager/zzaq;)V

    move v0, v1

    goto/16 :goto_26

    :catch_b1
    move-exception v2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception sending hit: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaSr:Lcom/google/android/gms/tagmanager/zzcx$zza;

    invoke-interface {v2, v0}, Lcom/google/android/gms/tagmanager/zzcx$zza;->zzc(Lcom/google/android/gms/tagmanager/zzaq;)V

    move v0, v1

    goto/16 :goto_26

    :cond_df
    return-void
.end method

.method public zzzX()Z
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcx;->zzaRY:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1d

    :cond_16
    const-string v0, "...no network connectivity"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x1

    goto :goto_1c
.end method
