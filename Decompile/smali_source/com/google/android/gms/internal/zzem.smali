.class public final Lcom/google/android/gms/internal/zzem;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/mediation/MediationAdRequest;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzaT:Ljava/util/Date;

.field private final zzaV:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaW:Z

.field private final zzaX:Landroid/location/Location;

.field private final zzsW:I

.field private final zzyV:I


# direct methods
.method public constructor <init>(Ljava/util/Date;ILjava/util/Set;Landroid/location/Location;ZI)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            "I",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/location/Location;",
            "ZI)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzem;->zzaT:Ljava/util/Date;

    iput p2, p0, Lcom/google/android/gms/internal/zzem;->zzsW:I

    iput-object p3, p0, Lcom/google/android/gms/internal/zzem;->zzaV:Ljava/util/Set;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzem;->zzaX:Landroid/location/Location;

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzem;->zzaW:Z

    iput p6, p0, Lcom/google/android/gms/internal/zzem;->zzyV:I

    return-void
.end method


# virtual methods
.method public getBirthday()Ljava/util/Date;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzem;->zzaT:Ljava/util/Date;

    return-object v0
.end method

.method public getGender()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zzem;->zzsW:I

    return v0
.end method

.method public getKeywords()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzem;->zzaV:Ljava/util/Set;

    return-object v0
.end method

.method public getLocation()Landroid/location/Location;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzem;->zzaX:Landroid/location/Location;

    return-object v0
.end method

.method public isTesting()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzem;->zzaW:Z

    return v0
.end method

.method public taggedForChildDirectedTreatment()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zzem;->zzyV:I

    return v0
.end method
