.class public abstract Lcom/google/android/gms/ads/internal/zzb;
.super Lcom/google/android/gms/ads/internal/zza;

# interfaces
.implements Lcom/google/android/gms/ads/internal/overlay/zzg;
.implements Lcom/google/android/gms/ads/internal/purchase/zzj;
.implements Lcom/google/android/gms/internal/zzdi;
.implements Lcom/google/android/gms/internal/zzeb;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final mMessenger:Landroid/os/Messenger;

.field protected final zzow:Lcom/google/android/gms/internal/zzeh;

.field protected transient zzox:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V
    .registers 9

    new-instance v0, Lcom/google/android/gms/ads/internal/zzq;

    invoke-direct {v0, p1, p2, p3, p5}, Lcom/google/android/gms/ads/internal/zzq;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, p4, v1, p6}, Lcom/google/android/gms/ads/internal/zzb;-><init>(Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/zzo;Lcom/google/android/gms/ads/internal/zzd;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/zzo;Lcom/google/android/gms/ads/internal/zzd;)V
    .registers 8

    invoke-direct {p0, p1, p3, p4}, Lcom/google/android/gms/ads/internal/zza;-><init>(Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/ads/internal/zzo;Lcom/google/android/gms/ads/internal/zzd;)V

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzow:Lcom/google/android/gms/internal/zzeh;

    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/google/android/gms/internal/zzfj;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzfj;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->mMessenger:Landroid/os/Messenger;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzox:Z

    return-void
.end method

.method private zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Landroid/os/Bundle;)Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;
    .registers 34

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    :try_start_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, v7, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1a
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a .. :try_end_1a} :catch_14d

    move-result-object v8

    :goto_1b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v20

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    if-eqz v2, :cond_a5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/zzq$zza;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_a5

    const/4 v2, 0x2

    new-array v2, v2, [I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v3, v2}, Lcom/google/android/gms/ads/internal/zzq$zza;->getLocationOnScreen([I)V

    const/4 v3, 0x0

    aget v4, v2, v3

    const/4 v3, 0x1

    aget v5, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/zzq$zza;->getWidth()I

    move-result v6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/zzq$zza;->getHeight()I

    move-result v9

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v3}, Lcom/google/android/gms/ads/internal/zzq$zza;->isShown()Z

    move-result v3

    if-eqz v3, :cond_86

    add-int v3, v4, v6

    if-lez v3, :cond_86

    add-int v3, v5, v9

    if-lez v3, :cond_86

    move-object/from16 v0, v20

    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    if-gt v4, v3, :cond_86

    move-object/from16 v0, v20

    iget v3, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    if-gt v5, v3, :cond_86

    const/4 v2, 0x1

    :cond_86
    new-instance v3, Landroid/os/Bundle;

    const/4 v10, 0x5

    invoke-direct {v3, v10}, Landroid/os/Bundle;-><init>(I)V

    const-string v10, "x"

    invoke-virtual {v3, v10, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "y"

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "width"

    invoke-virtual {v3, v4, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "height"

    invoke-virtual {v3, v4, v9}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "visible"

    invoke-virtual {v3, v4, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_a5
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzhl;->zzga()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    new-instance v4, Lcom/google/android/gms/internal/zzhk;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    invoke-direct {v4, v9, v5}, Lcom/google/android/gms/internal/zzhk;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v4, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzhk;->zzh(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    invoke-virtual {v2, v4, v5, v6}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Landroid/view/View;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/zzm;->zzq(Landroid/content/Context;)Lcom/google/android/gms/ads/internal/zzm;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/zzm;->zzbp()I

    move-result v23

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/zzm;->zzq(Landroid/content/Context;)Lcom/google/android/gms/ads/internal/zzm;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/zzm;->zzbn()Z

    move-result v22

    const-wide/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqm:Lcom/google/android/gms/ads/internal/client/zzu;

    if-eqz v2, :cond_113

    :try_start_109
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqm:Lcom/google/android/gms/ads/internal/client/zzu;

    invoke-interface {v2}, Lcom/google/android/gms/ads/internal/client/zzu;->getValue()J
    :try_end_112
    .catch Landroid/os/RemoteException; {:try_start_109 .. :try_end_112} :catch_151

    move-result-wide v24

    :cond_113
    :goto_113
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    invoke-virtual {v2, v4, v0, v9}, Lcom/google/android/gms/internal/zzhl;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzhn;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v12

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_131
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->zzqs:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzlh;->size()I

    move-result v4

    if-ge v2, v4, :cond_158

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->zzqs:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v4, v2}, Lcom/google/android/gms/internal/zzlh;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v14, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_131

    :catch_14d
    move-exception v2

    const/4 v8, 0x0

    goto/16 :goto_1b

    :catch_151
    move-exception v2

    const-string v2, "Cannot get correlation id, default to 0."

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_113

    :cond_158
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqn:Lcom/google/android/gms/internal/zzfm;

    if-eqz v2, :cond_1e3

    const/4 v2, 0x1

    move v4, v2

    :goto_162
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqo:Lcom/google/android/gms/internal/zzfq;

    if-eqz v2, :cond_1e7

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzhl;->zzgj()Z

    move-result v2

    if-eqz v2, :cond_1e7

    const/4 v2, 0x1

    move v15, v2

    :goto_176
    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/android/gms/internal/zzhl;->getSessionId()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v11, v11, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v13, v13, Lcom/google/android/gms/ads/internal/zzq;->zzqv:Ljava/util/List;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/gms/internal/zzhl;->zzge()Z

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzb;->mMessenger:Landroid/os/Messenger;

    move-object/from16 v17, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v18, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v19, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    move/from16 v20, v0

    invoke-static {}, Lcom/google/android/gms/internal/zzby;->zzde()Ljava/util/List;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzpY:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqt:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-object/from16 v29, v0

    new-instance v30, Lcom/google/android/gms/ads/internal/request/CapabilityParcel;

    move-object/from16 v0, v30

    invoke-direct {v0, v4, v15}, Lcom/google/android/gms/ads/internal/request/CapabilityParcel;-><init>(ZZ)V

    move-object/from16 v4, p1

    move-object/from16 v15, p2

    invoke-direct/range {v2 .. v30}, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;-><init>(Landroid/os/Bundle;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Landroid/content/pm/ApplicationInfo;Landroid/content/pm/PackageInfo;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Landroid/os/Bundle;Ljava/util/List;Ljava/util/List;Landroid/os/Bundle;ZLandroid/os/Messenger;IIFLjava/lang/String;ZIJLjava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Lcom/google/android/gms/ads/internal/request/CapabilityParcel;)V

    return-object v2

    :cond_1e3
    const/4 v2, 0x0

    move v4, v2

    goto/16 :goto_162

    :cond_1e7
    const/4 v2, 0x0

    move v15, v2

    goto :goto_176
.end method


# virtual methods
.method public getMediationAdapterClassName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyS:Ljava/lang/String;

    goto :goto_7
.end method

.method public onAdClicked()V
    .registers 11

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-nez v0, :cond_d

    const-string v0, "Ad state was null when trying to ping click URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :goto_c
    return-void

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    if-eqz v0, :cond_52

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzea;->zzyw:Ljava/util/List;

    if-eqz v0, :cond_52

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v7, v7, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v8, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v8, v8, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v8, v8, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-object v8, v8, Lcom/google/android/gms/internal/zzea;->zzyw:Ljava/util/List;

    iget-object v9, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v9, v9, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v9, v9, Lcom/google/android/gms/internal/zzhj;->zzDO:Ljava/lang/String;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzef;->zza(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzhj;Ljava/lang/String;ZLjava/util/List;)V

    :cond_52
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    if-eqz v0, :cond_97

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdz;->zzyp:Ljava/util/List;

    if-eqz v0, :cond_97

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v7, v7, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v8, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v8, v8, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v8, v8, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    iget-object v8, v8, Lcom/google/android/gms/internal/zzdz;->zzyp:Ljava/util/List;

    iget-object v9, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v9, v9, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v9, v9, Lcom/google/android/gms/internal/zzhj;->zzDO:Ljava/lang/String;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzef;->zza(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzhj;Ljava/lang/String;ZLjava/util/List;)V

    :cond_97
    invoke-super {p0}, Lcom/google/android/gms/ads/internal/zza;->onAdClicked()V

    goto/16 :goto_c
.end method

.method public pause()V
    .registers 3

    const-string v0, "pause must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbP()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/webkit/WebView;)Z

    :cond_2c
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_43

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyR:Lcom/google/android/gms/internal/zzei;

    if-eqz v0, :cond_43

    :try_start_3a
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyR:Lcom/google/android/gms/internal/zzei;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzei;->pause()V
    :try_end_43
    .catch Landroid/os/RemoteException; {:try_start_3a .. :try_end_43} :catch_52

    :cond_43
    :goto_43
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzou:Lcom/google/android/gms/internal/zzay;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzay;->zzg(Lcom/google/android/gms/internal/zzhj;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzo;->pause()V

    return-void

    :catch_52
    move-exception v0

    const-string v0, "Could not pause mediation adapter."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_43
.end method

.method public resume()V
    .registers 3

    const-string v0, "resume must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbP()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhv;->zzb(Landroid/webkit/WebView;)Z

    :cond_2c
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_43

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyR:Lcom/google/android/gms/internal/zzei;

    if-eqz v0, :cond_43

    :try_start_3a
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyR:Lcom/google/android/gms/internal/zzei;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzei;->resume()V
    :try_end_43
    .catch Landroid/os/RemoteException; {:try_start_3a .. :try_end_43} :catch_52

    :cond_43
    :goto_43
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzo;->resume()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzou:Lcom/google/android/gms/internal/zzay;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzay;->zzh(Lcom/google/android/gms/internal/zzhj;)V

    return-void

    :catch_52
    move-exception v0

    const-string v0, "Could not resume mediation adapter."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_43
.end method

.method public showInterstitial()V
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "showInterstitial is not supported for current ad type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzfm;)V
    .registers 3

    const-string v0, "setInAppPurchaseListener must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqn:Lcom/google/android/gms/internal/zzfm;

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzfq;Ljava/lang/String;)V
    .registers 7

    const-string v0, "setPlayStorePurchaseParams must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    new-instance v1, Lcom/google/android/gms/ads/internal/purchase/zzk;

    invoke-direct {v1, p2}, Lcom/google/android/gms/ads/internal/purchase/zzk;-><init>(Ljava/lang/String;)V

    iput-object v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqw:Lcom/google/android/gms/ads/internal/purchase/zzk;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqo:Lcom/google/android/gms/internal/zzfq;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgd()Z

    move-result v0

    if-nez v0, :cond_32

    if-eqz p1, :cond_32

    new-instance v0, Lcom/google/android/gms/ads/internal/purchase/zzc;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqo:Lcom/google/android/gms/internal/zzfq;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqw:Lcom/google/android/gms/ads/internal/purchase/zzk;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/ads/internal/purchase/zzc;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzfq;Lcom/google/android/gms/ads/internal/purchase/zzk;)V

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/purchase/zzc;->zzgn()Ljava/util/concurrent/Future;

    :cond_32
    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzhj;Z)V
    .registers 11

    if-nez p1, :cond_8

    const-string v0, "Ad state was null when trying to ping impression URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_7
    :goto_7
    return-void

    :cond_8
    invoke-super {p0, p1}, Lcom/google/android/gms/ads/internal/zza;->zzc(Lcom/google/android/gms/internal/zzhj;)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    if-eqz v0, :cond_3e

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzea;->zzyx:Ljava/util/List;

    if-eqz v0, :cond_3e

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v3, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v3

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v6, p1, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzea;->zzyx:Ljava/util/List;

    iget-object v7, p1, Lcom/google/android/gms/internal/zzhj;->zzDO:Ljava/lang/String;

    invoke-virtual {v3, v5, v6, v7}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    move-object v3, p1

    move v5, p2

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzef;->zza(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzhj;Ljava/lang/String;ZLjava/util/List;)V

    :cond_3e
    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    if-eqz v0, :cond_7

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdz;->zzyq:Ljava/util/List;

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v3, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v3

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v6, p1, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzdz;->zzyq:Ljava/util/List;

    iget-object v7, p1, Lcom/google/android/gms/internal/zzhj;->zzDO:Ljava/lang/String;

    invoke-virtual {v3, v5, v6, v7}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    move-object v3, p1

    move v5, p2

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzef;->zza(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzhj;Ljava/lang/String;ZLjava/util/List;)V

    goto :goto_7
.end method

.method public zza(Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v3, 0x0

    new-instance v0, Lcom/google/android/gms/ads/internal/purchase/zzd;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/google/android/gms/ads/internal/purchase/zzd;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqn:Lcom/google/android/gms/internal/zzfm;

    if-nez v1, :cond_92

    const-string v1, "InAppPurchaseListener is not set. Try to launch default purchase flow."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzR(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v0, "Google Play Service unavailable, cannot launch default purchase flow."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :goto_2e
    return-void

    :cond_2f
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqo:Lcom/google/android/gms/internal/zzfq;

    if-nez v1, :cond_3b

    const-string v0, "PlayStorePurchaseListener is not set."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_2e

    :cond_3b
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqw:Lcom/google/android/gms/ads/internal/purchase/zzk;

    if-nez v1, :cond_47

    const-string v0, "PlayStorePurchaseVerifier is not initialized."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_2e

    :cond_47
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqA:Z

    if-eqz v1, :cond_53

    const-string v0, "An in-app purchase request is already in progress, abort"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_2e

    :cond_53
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqA:Z

    :try_start_58
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqo:Lcom/google/android/gms/internal/zzfq;

    invoke-interface {v1, p1}, Lcom/google/android/gms/internal/zzfq;->isValidPurchase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_73

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqA:Z
    :try_end_67
    .catch Landroid/os/RemoteException; {:try_start_58 .. :try_end_67} :catch_68

    goto :goto_2e

    :catch_68
    move-exception v0

    const-string v0, "Could not start In-App purchase."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-boolean v3, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqA:Z

    goto :goto_2e

    :cond_73
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-boolean v3, v3, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIC:Z

    new-instance v4, Lcom/google/android/gms/ads/internal/purchase/GInAppPurchaseManagerInfoParcel;

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzq;->zzqw:Lcom/google/android/gms/ads/internal/purchase/zzk;

    invoke-direct {v4, v5, v6, v0, p0}, Lcom/google/android/gms/ads/internal/purchase/GInAppPurchaseManagerInfoParcel;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/purchase/zzk;Lcom/google/android/gms/internal/zzfl;Lcom/google/android/gms/ads/internal/purchase/zzj;)V

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/android/gms/ads/internal/purchase/zzi;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/purchase/GInAppPurchaseManagerInfoParcel;)V

    goto :goto_2e

    :cond_92
    :try_start_92
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqn:Lcom/google/android/gms/internal/zzfm;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzfm;->zza(Lcom/google/android/gms/internal/zzfl;)V
    :try_end_99
    .catch Landroid/os/RemoteException; {:try_start_92 .. :try_end_99} :catch_9a

    goto :goto_2e

    :catch_9a
    move-exception v0

    const-string v0, "Could not start In-App purchase."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_2e
.end method

.method public zza(Ljava/lang/String;ZILandroid/content/Intent;Lcom/google/android/gms/ads/internal/purchase/zzf;)V
    .registers 14

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqo:Lcom/google/android/gms/internal/zzfq;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v7, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqo:Lcom/google/android/gms/internal/zzfq;

    new-instance v0, Lcom/google/android/gms/ads/internal/purchase/zzg;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/ads/internal/purchase/zzg;-><init>(Landroid/content/Context;Ljava/lang/String;ZILandroid/content/Intent;Lcom/google/android/gms/ads/internal/purchase/zzf;)V

    invoke-interface {v7, v0}, Lcom/google/android/gms/internal/zzfq;->zza(Lcom/google/android/gms/internal/zzfp;)V
    :try_end_1b
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_1b} :catch_28

    :cond_1b
    :goto_1b
    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/ads/internal/zzb$1;

    invoke-direct {v1, p0, p4}, Lcom/google/android/gms/ads/internal/zzb$1;-><init>(Lcom/google/android/gms/ads/internal/zzb;Landroid/content/Intent;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :catch_28
    move-exception v0

    const-string v0, "Fail to invoke PlayStorePurchaseListener."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_1b
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzcd;)Z
    .registers 8

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzb;->zzaU()Z

    move-result v1

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzhl;->zzF(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbk;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/ads/internal/zzb;->zza(Lcom/google/android/gms/internal/zzbk;)Landroid/os/Bundle;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/zzo;->cancel()V

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput v0, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    invoke-direct {p0, p1, v1}, Lcom/google/android/gms/ads/internal/zzb;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Landroid/os/Bundle;)Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;

    move-result-object v0

    const-string v1, "seq_num"

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDB:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDQ:Ljava/lang/String;

    if-eqz v1, :cond_37

    const-string v1, "request_id"

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDQ:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    :cond_37
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDz:Landroid/content/pm/PackageInfo;

    if-eqz v1, :cond_48

    const-string v1, "app_version"

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDz:Landroid/content/pm/PackageInfo;

    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    :cond_48
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbt()Lcom/google/android/gms/ads/internal/request/zza;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->zzqa:Lcom/google/android/gms/internal/zzan;

    invoke-virtual {v2, v3, v0, v4, p0}, Lcom/google/android/gms/ads/internal/request/zza;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;Lcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/request/zza$zza;)Lcom/google/android/gms/internal/zzhq;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqd:Lcom/google/android/gms/internal/zzhq;

    const/4 v0, 0x1

    goto :goto_7
.end method

.method protected zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzhj;Z)Z
    .registers 8

    const-wide/16 v2, 0x0

    if-nez p3, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbP()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-wide v0, p2, Lcom/google/android/gms/internal/zzhj;->zzyA:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_20

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    iget-wide v2, p2, Lcom/google/android/gms/internal/zzhj;->zzyA:J

    invoke-virtual {v0, p1, v2, v3}, Lcom/google/android/gms/ads/internal/zzo;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;J)V

    :cond_19
    :goto_19
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzo;->zzbr()Z

    move-result v0

    return v0

    :cond_20
    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    if-eqz v0, :cond_36

    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzea;->zzyA:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_36

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    iget-object v1, p2, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-wide v2, v1, Lcom/google/android/gms/internal/zzea;->zzyA:J

    invoke-virtual {v0, p1, v2, v3}, Lcom/google/android/gms/ads/internal/zzo;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;J)V

    goto :goto_19

    :cond_36
    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzhj;->zzDX:Z

    if-nez v0, :cond_19

    iget v0, p2, Lcom/google/android/gms/internal/zzhj;->errorCode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzo;->zzf(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V

    goto :goto_19
.end method

.method zza(Lcom/google/android/gms/internal/zzhj;)Z
    .registers 6

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzot:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzot:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzot:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    :cond_a
    :goto_a
    invoke-virtual {p0, v1, p1, v0}, Lcom/google/android/gms/ads/internal/zzb;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzhj;Z)Z

    move-result v0

    return v0

    :cond_f
    iget-object v1, p1, Lcom/google/android/gms/internal/zzhj;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v2, v1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    if-eqz v2, :cond_a

    iget-object v2, v1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    const-string v3, "_noRefresh"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_a
.end method

.method protected zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_d

    iget-object v1, p1, Lcom/google/android/gms/internal/zzhj;->zzyT:Lcom/google/android/gms/internal/zzec;

    if-eqz v1, :cond_d

    iget-object v1, p1, Lcom/google/android/gms/internal/zzhj;->zzyT:Lcom/google/android/gms/internal/zzec;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzec;->zza(Lcom/google/android/gms/internal/zzeb;)V

    :cond_d
    iget-object v1, p2, Lcom/google/android/gms/internal/zzhj;->zzyT:Lcom/google/android/gms/internal/zzec;

    if-eqz v1, :cond_16

    iget-object v1, p2, Lcom/google/android/gms/internal/zzhj;->zzyT:Lcom/google/android/gms/internal/zzec;

    invoke-virtual {v1, p0}, Lcom/google/android/gms/internal/zzec;->zza(Lcom/google/android/gms/internal/zzeb;)V

    :cond_16
    iget-object v1, p2, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    if-eqz v1, :cond_2b

    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget v1, v0, Lcom/google/android/gms/internal/zzea;->zzyD:I

    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget v0, v0, Lcom/google/android/gms/internal/zzea;->zzyE:I

    :goto_22
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqx:Lcom/google/android/gms/internal/zzho;

    invoke-virtual {v2, v1, v0}, Lcom/google/android/gms/internal/zzho;->zzf(II)V

    const/4 v0, 0x1

    return v0

    :cond_2b
    move v1, v0

    goto :goto_22
.end method

.method protected zzaU()Z
    .registers 6

    const/4 v0, 0x1

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "android.permission.INTERNET"

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzhu;->zzI(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2c

    :cond_2b
    const/4 v0, 0x0

    :cond_2c
    return v0
.end method

.method public zzaV()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzou:Lcom/google/android/gms/internal/zzay;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzay;->zze(Lcom/google/android/gms/internal/zzhj;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzox:Z

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzb;->zzaQ()Z

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhk;->zzfV()V

    return-void
.end method

.method public zzaW()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzox:Z

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzb;->zzaS()Z

    return-void
.end method

.method public zzaX()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzb;->onAdClicked()V

    return-void
.end method

.method public zzaY()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzb;->zzaV()V

    return-void
.end method

.method public zzaZ()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzb;->zzaO()V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/internal/zzhj;)V
    .registers 9

    invoke-super {p0, p1}, Lcom/google/android/gms/ads/internal/zza;->zzb(Lcom/google/android/gms/internal/zzhj;)V

    iget v0, p1, Lcom/google/android/gms/internal/zzhj;->errorCode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_32

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    if-eqz v0, :cond_32

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzea;->zzyy:Ljava/util/List;

    if-eqz v0, :cond_32

    const-string v0, "Pinging no fill URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v3, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v3, p1, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-object v6, v3, Lcom/google/android/gms/internal/zzea;->zzyy:Ljava/util/List;

    move-object v3, p1

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzef;->zza(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzhj;Ljava/lang/String;ZLjava/util/List;)V

    :cond_32
    return-void
.end method

.method protected zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .registers 3

    invoke-super {p0, p1}, Lcom/google/android/gms/ads/internal/zza;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzox:Z

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public zzba()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzb;->zzaW()V

    return-void
.end method

.method public zzbb()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_28

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Mediation adapter "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzhj;->zzyS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " refreshed, but mediation adapters should never refresh."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_28
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/ads/internal/zzb;->zza(Lcom/google/android/gms/internal/zzhj;Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzb;->zzaT()Z

    return-void
.end method
