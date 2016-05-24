.class public Lcom/google/android/gms/internal/zzqo$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzqo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzqo$zza$zza;
    }
.end annotation


# instance fields
.field private final zzQA:Lcom/google/android/gms/common/api/Status;

.field private final zzaTJ:Lcom/google/android/gms/internal/zzqo$zza$zza;

.field private final zzaTK:[B

.field private final zzaTL:J

.field private final zzaTM:Lcom/google/android/gms/internal/zzqi;

.field private final zzaTN:Lcom/google/android/gms/internal/zzqp$zzc;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqo$zza$zza;)V
    .registers 12

    const/4 v3, 0x0

    const-wide/16 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    move-object v5, p3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzqo$zza;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;[BLcom/google/android/gms/internal/zzqp$zzc;Lcom/google/android/gms/internal/zzqo$zza$zza;J)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;[BLcom/google/android/gms/internal/zzqp$zzc;Lcom/google/android/gms/internal/zzqo$zza$zza;J)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzQA:Lcom/google/android/gms/common/api/Status;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTM:Lcom/google/android/gms/internal/zzqi;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTK:[B

    iput-object p4, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTN:Lcom/google/android/gms/internal/zzqp$zzc;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTJ:Lcom/google/android/gms/internal/zzqo$zza$zza;

    iput-wide p6, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTL:J

    return-void
.end method


# virtual methods
.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzQA:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method

.method public zzBA()Lcom/google/android/gms/internal/zzqp$zzc;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTN:Lcom/google/android/gms/internal/zzqp$zzc;

    return-object v0
.end method

.method public zzBB()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTL:J

    return-wide v0
.end method

.method public zzBx()Lcom/google/android/gms/internal/zzqo$zza$zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTJ:Lcom/google/android/gms/internal/zzqo$zza$zza;

    return-object v0
.end method

.method public zzBy()[B
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTK:[B

    return-object v0
.end method

.method public zzBz()Lcom/google/android/gms/internal/zzqi;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqo$zza;->zzaTM:Lcom/google/android/gms/internal/zzqi;

    return-object v0
.end method
