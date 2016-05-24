.class public interface abstract Lit/sephiroth/android/library/picasso/Downloader;
.super Ljava/lang/Object;
.source "Downloader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/Downloader$Response;,
        Lit/sephiroth/android/library/picasso/Downloader$ResponseException;
    }
.end annotation


# virtual methods
.method public abstract load(Landroid/net/Uri;I)Lit/sephiroth/android/library/picasso/Downloader$Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
