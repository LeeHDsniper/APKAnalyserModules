.class Lcom/google/android/gms/analytics/Tracker$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/Tracker;->send(Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzKN:Ljava/util/Map;

.field final synthetic zzKO:Z

.field final synthetic zzKP:Ljava/lang/String;

.field final synthetic zzKQ:J

.field final synthetic zzKR:Z

.field final synthetic zzKS:Z

.field final synthetic zzKT:Ljava/lang/String;

.field final synthetic zzKU:Lcom/google/android/gms/analytics/Tracker;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/Tracker;Ljava/util/Map;ZLjava/lang/String;JZZLjava/lang/String;)V
    .registers 11

    iput-object p1, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    iput-object p2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    iput-boolean p3, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKO:Z

    iput-object p4, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKP:Ljava/lang/String;

    iput-wide p5, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKQ:J

    iput-boolean p7, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKR:Z

    iput-boolean p8, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKS:Z

    iput-object p9, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKT:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    const/4 v11, 0x1

    const/4 v1, 0x0

    const-wide/16 v7, 0x0

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v0}, Lcom/google/android/gms/analytics/Tracker;->zza(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/Tracker$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/Tracker$zza;->zzhE()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "sc"

    const-string v3, "start"

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_19
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "cid"

    iget-object v3, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/Tracker;->zzhu()Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/GoogleAnalytics;->getClientId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzam;->zzc(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "sf"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_58

    const-wide/high16 v2, 0x4059000000000000L

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Ljava/lang/String;D)D

    move-result-wide v2

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v4, "cid"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v2, v3, v0}, Lcom/google/android/gms/analytics/internal/zzam;->zza(DLjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    const-string v1, "Sampling enabled. Hit sampled out. sample rate"

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/analytics/Tracker;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_57
    return-void

    :cond_58
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v0}, Lcom/google/android/gms/analytics/Tracker;->zzb(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zza;

    move-result-object v0

    iget-boolean v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKO:Z

    if-eqz v2, :cond_118

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v3, "ate"

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zza;->zzhM()Z

    move-result v4

    invoke-static {v2, v3, v4}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Z)V

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v3, "adid"

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zza;->zzhQ()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :goto_78
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v0}, Lcom/google/android/gms/analytics/Tracker;->zzc(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zzk;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzk;->zziL()Lcom/google/android/gms/internal/zzok;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v3, "an"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzok;->zzjZ()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v3, "av"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzok;->zzkb()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v3, "aid"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzok;->zztW()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v3, "aiid"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzok;->zzxA()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "v"

    const-string v3, "1"

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "_v"

    sget-object v3, Lcom/google/android/gms/analytics/internal/zze;->zzLB:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "ul"

    iget-object v3, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v3}, Lcom/google/android/gms/analytics/Tracker;->zzd(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zzu;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zzu;->zzjS()Lcom/google/android/gms/internal/zzom;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzom;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "sr"

    iget-object v3, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v3}, Lcom/google/android/gms/analytics/Tracker;->zze(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zzu;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zzu;->zzjT()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKP:Ljava/lang/String;

    const-string v2, "transaction"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_fa

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKP:Ljava/lang/String;

    const-string v2, "item"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    :cond_fa
    move v0, v11

    :goto_fb
    if-nez v0, :cond_12a

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v0}, Lcom/google/android/gms/analytics/Tracker;->zzf(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zzad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzad;->zzkp()Z

    move-result v0

    if-nez v0, :cond_12a

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v0}, Lcom/google/android/gms/analytics/Tracker;->zzg(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "Too many hits sent too quickly, rate limiting invoked"

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zzh(Ljava/util/Map;Ljava/lang/String;)V

    goto/16 :goto_57

    :cond_118
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "ate"

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "adid"

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_78

    :cond_128
    move v0, v1

    goto :goto_fb

    :cond_12a
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "ht"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzam;->zzbo(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v0, v4, v7

    if-nez v0, :cond_13e

    iget-wide v4, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKQ:J

    :cond_13e
    iget-boolean v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKR:Z

    if-eqz v0, :cond_15a

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzab;

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    iget-object v3, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    iget-boolean v6, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKS:Z

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/analytics/internal/zzab;-><init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZ)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v0}, Lcom/google/android/gms/analytics/Tracker;->zzh(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v2, "Dry run enabled. Would have sent hit"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzaf;->zzc(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_57

    :cond_15a
    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "cid"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    const-string v0, "uid"

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    invoke-static {v14, v0, v2}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    const-string v0, "an"

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    invoke-static {v14, v0, v2}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    const-string v0, "aid"

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    invoke-static {v14, v0, v2}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    const-string v0, "av"

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    invoke-static {v14, v0, v2}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    const-string v0, "aiid"

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    invoke-static {v14, v0, v2}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    new-instance v6, Lcom/google/android/gms/analytics/internal/zzh;

    iget-object v10, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKT:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v2, "adid"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1cf

    :goto_1a0
    move-wide v12, v7

    invoke-direct/range {v6 .. v14}, Lcom/google/android/gms/analytics/internal/zzh;-><init>(JLjava/lang/String;Ljava/lang/String;ZJLjava/util/Map;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v0}, Lcom/google/android/gms/analytics/Tracker;->zzi(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/google/android/gms/analytics/internal/zzb;->zza(Lcom/google/android/gms/analytics/internal/zzh;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    const-string v3, "_s"

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzab;

    iget-object v2, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    iget-object v3, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKN:Ljava/util/Map;

    iget-boolean v6, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKS:Z

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/analytics/internal/zzab;-><init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZ)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/Tracker$1;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-static {v0}, Lcom/google/android/gms/analytics/Tracker;->zzj(Lcom/google/android/gms/analytics/Tracker;)Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzb;->zza(Lcom/google/android/gms/analytics/internal/zzab;)V

    goto/16 :goto_57

    :cond_1cf
    move v11, v1

    goto :goto_1a0
.end method
