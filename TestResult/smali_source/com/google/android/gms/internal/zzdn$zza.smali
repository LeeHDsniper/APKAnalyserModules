.class public Lcom/google/android/gms/internal/zzdn$zza;
.super Lcom/google/android/gms/internal/zzhq;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzdn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation


# instance fields
.field private final zzF:Ljava/lang/String;

.field private final zzoL:Lcom/google/android/gms/internal/zzip;

.field private final zzxn:Ljava/lang/String;

.field private final zzxo:Ljava/lang/String;

.field private final zzxp:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzip;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhq;-><init>()V

    const-string v0, "play.google.com"

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzxn:Ljava/lang/String;

    const-string v0, "market"

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzxo:Ljava/lang/String;

    const/16 v0, 0xa

    iput v0, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzxp:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzoL:Lcom/google/android/gms/internal/zzip;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzF:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onStop()V
    .registers 1

    return-void
.end method

.method public zzY(Ljava/lang/String;)Landroid/content/Intent;
    .registers 5

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object v1
.end method

.method public zzdG()V
    .registers 9

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzF:Ljava/lang/String;

    :goto_3
    const/16 v1, 0xa

    if-ge v0, v1, :cond_115

    add-int/lit8 v4, v0, 0x1

    :try_start_9
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const-string v1, "play.google.com"

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_17
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_9 .. :try_end_17} :catch_b2
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_17} :catch_cd
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_17} :catch_e8

    move-result v1

    if-eqz v1, :cond_29

    move-object v0, v2

    :goto_1b
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzdn$zza;->zzY(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_29
    :try_start_29
    const-string v1, "market"

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_37

    move-object v0, v2

    goto :goto_1b

    :cond_37
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_3d
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_29 .. :try_end_3d} :catch_b2
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_3d} :catch_cd
    .catch Ljava/lang/RuntimeException; {:try_start_29 .. :try_end_3d} :catch_e8

    :try_start_3d
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v3}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v5, p0, Lcom/google/android/gms/internal/zzdn$zza;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v5}, Lcom/google/android/gms/internal/zzip;->zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v5

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v1, v3, v5, v6, v0}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/lang/String;ZLjava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v5

    const-string v3, ""

    const/16 v6, 0x12c

    if-lt v1, v6, :cond_112

    const/16 v6, 0x18f

    if-gt v1, v6, :cond_112

    const/4 v1, 0x0

    const-string v6, "Location"

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_95

    const-string v1, "Location"

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    :cond_76
    :goto_76
    if-eqz v1, :cond_112

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_112

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_85
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_a6

    const-string v1, "Arrived at landing page, this ideally should not happen. Will open it in browser."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V
    :try_end_90
    .catchall {:try_start_3d .. :try_end_90} :catchall_ad

    :try_start_90
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_93
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_90 .. :try_end_93} :catch_b2
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_93} :catch_cd
    .catch Ljava/lang/RuntimeException; {:try_start_90 .. :try_end_93} :catch_e8

    move-object v0, v2

    goto :goto_1b

    :cond_95
    :try_start_95
    const-string v6, "location"

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_76

    const-string v1, "location"

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;
    :try_end_a5
    .catchall {:try_start_95 .. :try_end_a5} :catchall_ad

    goto :goto_76

    :cond_a6
    :try_start_a6
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_a9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_a6 .. :try_end_a9} :catch_10d
    .catch Ljava/io/IOException; {:try_start_a6 .. :try_end_a9} :catch_108
    .catch Ljava/lang/RuntimeException; {:try_start_a6 .. :try_end_a9} :catch_103

    move v0, v4

    move-object v2, v1

    goto/16 :goto_3

    :catchall_ad
    move-exception v1

    :try_start_ae
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v1
    :try_end_b2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_ae .. :try_end_b2} :catch_b2
    .catch Ljava/io/IOException; {:try_start_ae .. :try_end_b2} :catch_cd
    .catch Ljava/lang/RuntimeException; {:try_start_ae .. :try_end_b2} :catch_e8

    :catch_b2
    move-exception v0

    move-object v1, v0

    move-object v0, v2

    :goto_b5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error while parsing ping URL: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    :catch_cd
    move-exception v0

    move-object v1, v0

    move-object v0, v2

    :goto_d0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error while pinging URL: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    :catch_e8
    move-exception v0

    move-object v1, v0

    move-object v0, v2

    :goto_eb
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error while pinging URL: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    :catch_103
    move-exception v0

    move-object v7, v0

    move-object v0, v1

    move-object v1, v7

    goto :goto_eb

    :catch_108
    move-exception v0

    move-object v7, v0

    move-object v0, v1

    move-object v1, v7

    goto :goto_d0

    :catch_10d
    move-exception v0

    move-object v7, v0

    move-object v0, v1

    move-object v1, v7

    goto :goto_b5

    :cond_112
    move-object v1, v3

    goto/16 :goto_85

    :cond_115
    move-object v0, v2

    goto/16 :goto_1b
.end method
