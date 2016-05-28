.class public Lcom/google/android/gms/internal/zzgv;
.super Lcom/google/android/gms/ads/internal/reward/client/zza$zza;


# instance fields
.field private final zzFz:Ljava/lang/String;

.field private final zzGe:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/reward/client/zza$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgv;->zzFz:Ljava/lang/String;

    iput p2, p0, Lcom/google/android/gms/internal/zzgv;->zzGe:I

    return-void
.end method


# virtual methods
.method public getAmount()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zzgv;->zzGe:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgv;->zzFz:Ljava/lang/String;

    return-object v0
.end method
