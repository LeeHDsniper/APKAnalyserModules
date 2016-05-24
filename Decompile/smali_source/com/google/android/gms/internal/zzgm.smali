.class public final Lcom/google/android/gms/internal/zzgm;
.super Lcom/google/android/gms/ads/internal/request/zzj$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# static fields
.field private static zzEL:Lcom/google/android/gms/internal/zzgm;

.field private static final zzpm:Ljava/lang/Object;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzEM:Lcom/google/android/gms/internal/zzgl;

.field private final zzEN:Lcom/google/android/gms/internal/zzbr;

.field private final zzqU:Lcom/google/android/gms/internal/zzdv;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzgm;->zzpm:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzbr;Lcom/google/android/gms/internal/zzgl;)V
    .registers 10

    const v4, 0x7877d8

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/request/zzj$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgm;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgm;->zzEM:Lcom/google/android/gms/internal/zzgl;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgm;->zzEN:Lcom/google/android/gms/internal/zzbr;

    new-instance v0, Lcom/google/android/gms/internal/zzdv;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_32

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    :goto_18
    new-instance v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    const/4 v3, 0x1

    invoke-direct {v2, v4, v4, v3}, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;-><init>(IIZ)V

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzbr;->zzdb()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/google/android/gms/internal/zzgm$5;

    invoke-direct {v4, p0}, Lcom/google/android/gms/internal/zzgm$5;-><init>(Lcom/google/android/gms/internal/zzgm;)V

    new-instance v5, Lcom/google/android/gms/internal/zzdv$zzc;

    invoke-direct {v5}, Lcom/google/android/gms/internal/zzdv$zzc;-><init>()V

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzdv;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzdv$zzb;Lcom/google/android/gms/internal/zzdv$zzb;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgm;->zzqU:Lcom/google/android/gms/internal/zzdv;

    return-void

    :cond_32
    move-object v1, p1

    goto :goto_18
.end method

.method private static zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzbr;Lcom/google/android/gms/internal/zzgl;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
    .registers 23

    const-string v2, "Starting ad request from service."

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static/range {p0 .. p0}, Lcom/google/android/gms/internal/zzby;->zzw(Landroid/content/Context;)V

    new-instance v13, Lcom/google/android/gms/internal/zzcd;

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzuB:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const-string v3, "load_ad"

    move-object/from16 v0, p4

    iget-object v4, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    invoke-direct {v13, v2, v3, v4}, Lcom/google/android/gms/internal/zzcd;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p4

    iget v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/16 v3, 0xa

    if-le v2, v3, :cond_46

    move-object/from16 v0, p4

    iget-wide v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDT:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_46

    move-object/from16 v0, p4

    iget-wide v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDT:J

    invoke-virtual {v13, v2, v3}, Lcom/google/android/gms/internal/zzcd;->zzb(J)Lcom/google/android/gms/internal/zzcc;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "cts"

    aput-object v5, v3, v4

    invoke-virtual {v13, v2, v3}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    :cond_46
    invoke-virtual {v13}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v17

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgl;->zzEH:Lcom/google/android/gms/internal/zzdw;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzdw;->init()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbD()Lcom/google/android/gms/internal/zzgs;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzgs;->zzD(Landroid/content/Context;)Lcom/google/android/gms/internal/zzgr;

    move-result-object v4

    iget v2, v4, Lcom/google/android/gms/internal/zzgr;->zzFN:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_6c

    const-string v2, "Device is offline."

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    :goto_6b
    return-object v2

    :cond_6c
    move-object/from16 v0, p4

    iget v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/4 v3, 0x7

    if-lt v2, v3, :cond_a2

    move-object/from16 v0, p4

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDQ:Ljava/lang/String;

    move-object v11, v2

    :goto_78
    new-instance v12, Lcom/google/android/gms/internal/zzgo;

    move-object/from16 v0, p4

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {v12, v11, v2}, Lcom/google/android/gms/internal/zzgo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p4

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    if-eqz v2, :cond_ac

    move-object/from16 v0, p4

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    const-string v3, "_ad"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_ac

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/zzgn;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Ljava/lang/String;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-result-object v2

    goto :goto_6b

    :cond_a2
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v11, v2

    goto :goto_78

    :cond_ac
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgl;->zzEH:Lcom/google/android/gms/internal/zzdw;

    const-wide/16 v6, 0xfa

    invoke-interface {v2, v6, v7}, Lcom/google/android/gms/internal/zzdw;->zzc(J)Landroid/location/Location;

    move-result-object v6

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgl;->zzEI:Lcom/google/android/gms/internal/zzfh;

    move-object/from16 v0, p4

    iget-object v3, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDz:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-interface {v2, v0, v3}, Lcom/google/android/gms/internal/zzfh;->zzc(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgl;->zzEG:Lcom/google/android/gms/internal/zzbt;

    move-object/from16 v0, p4

    invoke-interface {v2, v0}, Lcom/google/android/gms/internal/zzbt;->zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Ljava/util/List;

    move-result-object v10

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgl;->zzEJ:Lcom/google/android/gms/internal/zzhi;

    move-object/from16 v0, p4

    iget-object v3, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDA:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/google/android/gms/internal/zzhi;->zzau(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgl;->zzEK:Lcom/google/android/gms/internal/zzgt;

    move-object/from16 v0, p0

    invoke-interface {v2, v0}, Lcom/google/android/gms/internal/zzgt;->zzE(Landroid/content/Context;)Lcom/google/android/gms/internal/zzgt$zza;

    move-result-object v5

    move-object/from16 v2, p0

    move-object/from16 v3, p4

    move-object/from16 v7, p2

    invoke-static/range {v2 .. v10}, Lcom/google/android/gms/internal/zzgn;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgr;Lcom/google/android/gms/internal/zzgt$zza;Landroid/location/Location;Lcom/google/android/gms/internal/zzbr;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lorg/json/JSONObject;

    move-result-object v2

    move-object/from16 v0, p4

    iget v3, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/4 v4, 0x7

    if-ge v3, v4, :cond_fc

    :try_start_f7
    const-string v3, "request_id"

    invoke-virtual {v2, v3, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_fc
    .catch Lorg/json/JSONException; {:try_start_f7 .. :try_end_fc} :catch_217

    :cond_fc
    :goto_fc
    if-nez v2, :cond_106

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    goto/16 :goto_6b

    :cond_106
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "arc"

    aput-object v4, v2, v3

    move-object/from16 v0, v17

    invoke-virtual {v13, v0, v2}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    invoke-virtual {v13}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v6

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zztX:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_159

    sget-object v9, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzgm$1;

    move-object/from16 v3, p1

    move-object v4, v12

    move-object v5, v13

    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/internal/zzgm$1;-><init>(Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzgo;Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;Ljava/lang/String;)V

    invoke-virtual {v9, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_137
    :try_start_137
    invoke-virtual {v12}, Lcom/google/android/gms/internal/zzgo;->zzfI()Ljava/util/concurrent/Future;

    move-result-object v2

    const-wide/16 v4, 0xa

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v4, v5, v3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/zzgq;
    :try_end_145
    .catch Ljava/lang/Exception; {:try_start_137 .. :try_end_145} :catch_16c
    .catchall {:try_start_137 .. :try_end_145} :catchall_20b

    if-nez v9, :cond_17f

    :try_start_147
    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V
    :try_end_14d
    .catchall {:try_start_147 .. :try_end_14d} :catchall_20b

    sget-object v3, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzgm$3;

    invoke-direct {v4, v12}, Lcom/google/android/gms/internal/zzgm$3;-><init>(Lcom/google/android/gms/internal/zzgo;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_6b

    :cond_159
    sget-object v2, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v9, Lcom/google/android/gms/internal/zzgm$2;

    move-object/from16 v10, p0

    move-object/from16 v11, p4

    move-object v14, v6

    move-object v15, v7

    move-object/from16 v16, p2

    invoke-direct/range {v9 .. v16}, Lcom/google/android/gms/internal/zzgm$2;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgo;Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;Ljava/lang/String;Lcom/google/android/gms/internal/zzbr;)V

    invoke-virtual {v2, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_137

    :catch_16c
    move-exception v2

    :try_start_16d
    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V
    :try_end_173
    .catchall {:try_start_16d .. :try_end_173} :catchall_20b

    sget-object v3, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzgm$3;

    invoke-direct {v4, v12}, Lcom/google/android/gms/internal/zzgm$3;-><init>(Lcom/google/android/gms/internal/zzgo;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_6b

    :cond_17f
    :try_start_17f
    invoke-virtual {v9}, Lcom/google/android/gms/internal/zzgq;->getErrorCode()I

    move-result v2

    const/4 v3, -0x2

    if-eq v2, v3, :cond_19b

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-virtual {v9}, Lcom/google/android/gms/internal/zzgq;->getErrorCode()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V
    :try_end_18f
    .catchall {:try_start_17f .. :try_end_18f} :catchall_20b

    sget-object v3, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzgm$3;

    invoke-direct {v4, v12}, Lcom/google/android/gms/internal/zzgm$3;-><init>(Lcom/google/android/gms/internal/zzgo;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_6b

    :cond_19b
    :try_start_19b
    invoke-virtual {v13}, Lcom/google/android/gms/internal/zzcd;->zzdo()Lcom/google/android/gms/internal/zzcc;

    move-result-object v2

    if-eqz v2, :cond_1b0

    invoke-virtual {v13}, Lcom/google/android/gms/internal/zzcd;->zzdo()Lcom/google/android/gms/internal/zzcc;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "rur"

    aput-object v5, v3, v4

    invoke-virtual {v13, v2, v3}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    :cond_1b0
    const/4 v7, 0x0

    invoke-virtual {v9}, Lcom/google/android/gms/internal/zzgq;->zzfM()Z

    move-result v2

    if-eqz v2, :cond_1c5

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgl;->zzEF:Lcom/google/android/gms/internal/zzhf;

    move-object/from16 v0, p4

    iget-object v3, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDz:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/google/android/gms/internal/zzhf;->zzat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :cond_1c5
    move-object/from16 v0, p4

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v5, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {v9}, Lcom/google/android/gms/internal/zzgq;->getUrl()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v3, p4

    move-object/from16 v4, p0

    move-object v10, v13

    invoke-static/range {v3 .. v10}, Lcom/google/android/gms/internal/zzgm;->zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzgq;Lcom/google/android/gms/internal/zzcd;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-result-object v2

    iget v3, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEj:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1ec

    move-object/from16 v0, p3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgl;->zzEI:Lcom/google/android/gms/internal/zzfh;

    move-object/from16 v0, p4

    iget-object v4, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDz:Landroid/content/pm/PackageInfo;

    iget-object v4, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-interface {v3, v0, v4}, Lcom/google/android/gms/internal/zzfh;->clearToken(Landroid/content/Context;Ljava/lang/String;)V

    :cond_1ec
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "tts"

    aput-object v5, v3, v4

    move-object/from16 v0, v17

    invoke-virtual {v13, v0, v3}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    invoke-virtual {v13}, Lcom/google/android/gms/internal/zzcd;->zzdn()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEl:Ljava/lang/String;
    :try_end_1ff
    .catchall {:try_start_19b .. :try_end_1ff} :catchall_20b

    sget-object v3, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzgm$3;

    invoke-direct {v4, v12}, Lcom/google/android/gms/internal/zzgm$3;-><init>(Lcom/google/android/gms/internal/zzgo;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_6b

    :catchall_20b
    move-exception v2

    sget-object v3, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzgm$3;

    invoke-direct {v4, v12}, Lcom/google/android/gms/internal/zzgm$3;-><init>(Lcom/google/android/gms/internal/zzgo;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw v2

    :catch_217
    move-exception v3

    goto/16 :goto_fc
.end method

.method public static zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzgq;Lcom/google/android/gms/internal/zzcd;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
    .registers 21

    if-eqz p7, :cond_df

    invoke-virtual/range {p7 .. p7}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v2

    move-object v3, v2

    :goto_7
    :try_start_7
    new-instance v6, Lcom/google/android/gms/internal/zzgp;

    invoke-direct {v6, p0}, Lcom/google/android/gms/internal/zzgp;-><init>(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AdRequestServiceImpl: Sending request: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    new-instance v4, Ljava/net/URL;

    move-object/from16 v0, p3

    invoke-direct {v4, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbB()Lcom/google/android/gms/internal/zzlm;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/internal/zzlm;->elapsedRealtime()J

    move-result-wide v8

    move-object v5, v4

    move v4, v2

    :goto_36
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_3c} :catch_152

    :try_start_3c
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v7

    const/4 v10, 0x0

    invoke-virtual {v7, p1, p2, v10, v2}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/lang/String;ZLjava/net/HttpURLConnection;)V

    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_51

    const-string v7, "x-afma-drt-cookie"

    move-object/from16 v0, p4

    invoke-virtual {v2, v7, v0}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_51
    invoke-static/range {p5 .. p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_71

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Bearer "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p5

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v10, "Authorization"

    invoke-virtual {v2, v10, v7}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_71
    if-eqz p6, :cond_9c

    invoke-virtual/range {p6 .. p6}, Lcom/google/android/gms/internal/zzgq;->zzfL()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_9c

    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    invoke-virtual/range {p6 .. p6}, Lcom/google/android/gms/internal/zzgq;->zzfL()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    array-length v10, v7

    invoke-virtual {v2, v10}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    new-instance v10, Ljava/io/BufferedOutputStream;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v10, v7}, Ljava/io/BufferedOutputStream;->write([B)V

    invoke-virtual {v10}, Ljava/io/BufferedOutputStream;->close()V

    :cond_9c
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v10

    const/16 v11, 0xc8

    if-lt v7, v11, :cond_e3

    const/16 v11, 0x12c

    if-ge v7, v11, :cond_e3

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v5

    new-instance v11, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v5, v11}, Lcom/google/android/gms/internal/zzhu;->zza(Ljava/io/InputStreamReader;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v10, v5, v7}, Lcom/google/android/gms/internal/zzgm;->zza(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;I)V

    invoke-virtual {v6, v4, v10, v5}, Lcom/google/android/gms/internal/zzgp;->zzb(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    if-eqz p7, :cond_d6

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v7, "ufe"

    aput-object v7, v4, v5

    move-object/from16 v0, p7

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    :cond_d6
    invoke-virtual {v6, v8, v9}, Lcom/google/android/gms/internal/zzgp;->zzj(J)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
    :try_end_d9
    .catchall {:try_start_3c .. :try_end_d9} :catchall_175

    move-result-object v3

    :try_start_da
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_dd
    .catch Ljava/io/IOException; {:try_start_da .. :try_end_dd} :catch_152

    move-object v2, v3

    :goto_de
    return-object v2

    :cond_df
    const/4 v2, 0x0

    move-object v3, v2

    goto/16 :goto_7

    :cond_e3
    :try_start_e3
    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x0

    invoke-static {v5, v10, v11, v7}, Lcom/google/android/gms/internal/zzgm;->zza(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;I)V

    const/16 v5, 0x12c

    if-lt v7, v5, :cond_129

    const/16 v5, 0x190

    if-ge v7, v5, :cond_129

    const-string v5, "Location"

    invoke-virtual {v2, v5}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_10f

    const-string v3, "No location header to follow redirect."

    invoke-static {v3}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V
    :try_end_10a
    .catchall {:try_start_e3 .. :try_end_10a} :catchall_175

    :try_start_10a
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_10d
    .catch Ljava/io/IOException; {:try_start_10a .. :try_end_10d} :catch_152

    move-object v2, v3

    goto :goto_de

    :cond_10f
    :try_start_10f
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    add-int/lit8 v4, v4, 0x1

    const/4 v7, 0x5

    if-le v4, v7, :cond_14a

    const-string v3, "Too many redirects."

    invoke-static {v3}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V
    :try_end_124
    .catchall {:try_start_10f .. :try_end_124} :catchall_175

    :try_start_124
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_127
    .catch Ljava/io/IOException; {:try_start_124 .. :try_end_127} :catch_152

    move-object v2, v3

    goto :goto_de

    :cond_129
    :try_start_129
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received error HTTP response code: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V
    :try_end_145
    .catchall {:try_start_129 .. :try_end_145} :catchall_175

    :try_start_145
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_148
    .catch Ljava/io/IOException; {:try_start_145 .. :try_end_148} :catch_152

    move-object v2, v3

    goto :goto_de

    :cond_14a
    :try_start_14a
    invoke-virtual {v6, v10}, Lcom/google/android/gms/internal/zzgp;->zzh(Ljava/util/Map;)V
    :try_end_14d
    .catchall {:try_start_14a .. :try_end_14d} :catchall_175

    :try_start_14d
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_150
    .catch Ljava/io/IOException; {:try_start_14d .. :try_end_150} :catch_152

    goto/16 :goto_36

    :catch_152
    move-exception v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error while connecting to ad server: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    goto/16 :goto_de

    :catchall_175
    move-exception v3

    :try_start_176
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v3
    :try_end_17a
    .catch Ljava/io/IOException; {:try_start_176 .. :try_end_17a} :catch_152
.end method

.method public static zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzbr;Lcom/google/android/gms/internal/zzgl;)Lcom/google/android/gms/internal/zzgm;
    .registers 6

    sget-object v1, Lcom/google/android/gms/internal/zzgm;->zzpm:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/google/android/gms/internal/zzgm;->zzEL:Lcom/google/android/gms/internal/zzgm;

    if-nez v0, :cond_18

    new-instance v0, Lcom/google/android/gms/internal/zzgm;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    if-eqz v2, :cond_13

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    :cond_13
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzgm;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzbr;Lcom/google/android/gms/internal/zzgl;)V

    sput-object v0, Lcom/google/android/gms/internal/zzgm;->zzEL:Lcom/google/android/gms/internal/zzgm;

    :cond_18
    sget-object v0, Lcom/google/android/gms/internal/zzgm;->zzEL:Lcom/google/android/gms/internal/zzgm;

    monitor-exit v1

    return-object v0

    :catchall_1c
    move-exception v0

    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v0
.end method

.method private static zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;)Lcom/google/android/gms/internal/zziq$zza;
    .registers 4

    new-instance v0, Lcom/google/android/gms/internal/zzgm$4;

    invoke-direct {v0, p1, p2, p0}, Lcom/google/android/gms/internal/zzgm$4;-><init>(Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;Ljava/lang/String;)V

    return-object v0
.end method

.method private static zza(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;I)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    const/4 v0, 0x2

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzM(I)Z

    move-result v0

    if-eqz v0, :cond_cc

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Http Response: {\n  URL:\n    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n  Headers:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    if-eqz p1, :cond_82

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_82

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "      "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    goto :goto_5f

    :cond_82
    const-string v0, "  Body:"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    if-eqz p2, :cond_ab

    const/4 v0, 0x0

    :goto_8a
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const v2, 0x186a0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    if-ge v0, v1, :cond_b0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit16 v2, v0, 0x3e8

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    add-int/lit16 v0, v0, 0x3e8

    goto :goto_8a

    :cond_ab
    const-string v0, "    null"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    :cond_b0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  Response Code:\n    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    :cond_cc
    return-void
.end method

.method static synthetic zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;)Lcom/google/android/gms/internal/zziq$zza;
    .registers 4

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/zzgm;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;)Lcom/google/android/gms/internal/zziq$zza;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/ads/internal/request/zzk;)V
    .registers 6

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm;->mContext:Landroid/content/Context;

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzhl;->zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    new-instance v0, Lcom/google/android/gms/internal/zzgm$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzgm$6;-><init>(Lcom/google/android/gms/internal/zzgm;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/ads/internal/request/zzk;)V

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhu;->zzb(Ljava/lang/Runnable;)V

    return-void
.end method

.method public zze(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgm;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm;->zzqU:Lcom/google/android/gms/internal/zzdv;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgm;->zzEN:Lcom/google/android/gms/internal/zzbr;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgm;->zzEM:Lcom/google/android/gms/internal/zzgl;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/google/android/gms/internal/zzgm;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzbr;Lcom/google/android/gms/internal/zzgl;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-result-object v0

    return-object v0
.end method
