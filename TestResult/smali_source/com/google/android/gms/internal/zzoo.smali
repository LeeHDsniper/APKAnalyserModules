.class public final Lcom/google/android/gms/internal/zzoo;
.super Lcom/google/android/gms/internal/zzod;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzod",
        "<",
        "Lcom/google/android/gms/internal/zzoo;",
        ">;"
    }
.end annotation


# instance fields
.field private mCategory:Ljava/lang/String;

.field private zzOj:Ljava/lang/String;

.field private zzaID:Ljava/lang/String;

.field private zzasE:J


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzod;-><init>()V

    return-void
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->zzOj:Ljava/lang/String;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->zzaID:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzoo;->zzasE:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "category"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzoo;->mCategory:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "action"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzoo;->zzOj:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "label"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzoo;->zzaID:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "value"

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzoo;->zzasE:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzoo;->zzA(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzM(J)V
    .registers 4

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzoo;->zzasE:J

    return-void
.end method

.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzod;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/internal/zzoo;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzoo;->zza(Lcom/google/android/gms/internal/zzoo;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzoo;)V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->mCategory:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->mCategory:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzoo;->zzdR(Ljava/lang/String;)V

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->zzOj:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->zzOj:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzoo;->zzdS(Ljava/lang/String;)V

    :cond_1a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->zzaID:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->zzaID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzoo;->zzdT(Ljava/lang/String;)V

    :cond_27
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzoo;->zzasE:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_34

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzoo;->zzasE:J

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzoo;->zzM(J)V

    :cond_34
    return-void
.end method

.method public zzdR(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoo;->mCategory:Ljava/lang/String;

    return-void
.end method

.method public zzdS(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoo;->zzOj:Ljava/lang/String;

    return-void
.end method

.method public zzdT(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoo;->zzaID:Ljava/lang/String;

    return-void
.end method

.method public zzxQ()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoo;->mCategory:Ljava/lang/String;

    return-object v0
.end method
